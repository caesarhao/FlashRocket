
package component{
    import flash.display.Sprite;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.display.Shape;
    public class RocketComponent extends Component{
        protected var _weightKg:Number;
        protected var _pivotShape : Shape;
        protected var _centerShape : Shape;
        public function get weightKg():Number
        {
        	return _weightKg;
        }
        protected var _pivot:Point;

        public function get pivot():Point
        {
        	return _pivot;
        }
        public function get pivotX():Number
        {
        	return pivot.x;
        }
        public function get pivotY():Number
        {
        	return pivot.y;
        }
        public function RocketComponent(weightKg : Number = 0){
            _pivot = new Point(0, 0);
            _pivotShape = new Shape();
            addChild(_pivotShape);
            _centerShape = new Shape();
            addChild(_centerShape);
            _weightKg = weightKg;
        }
        
        public function drawPivot():void{
            var R:Number = 5;
            var r:Number = 3;
            _pivotShape.graphics.lineStyle(1, 0x000000, 1);
            _pivotShape.graphics.drawCircle(pivotX, pivotY, R);
            _pivotShape.graphics.beginFill(0x000000, 1);
            _pivotShape.graphics.moveTo(pivotX, pivotY-R);
            _pivotShape.graphics.lineTo(pivotX + R*Math.sqrt(3)/2, pivotY+R/2);
            _pivotShape.graphics.lineTo(pivotX - R*Math.sqrt(3)/2, pivotY+R/2);
            _pivotShape.graphics.lineTo(pivotX, pivotY-R);
            _pivotShape.graphics.endFill();
        }
        public function hidePivot():void{
            _pivotShape.alpha = 0;
        }
        public function showPivot():void{
            _pivotShape.alpha = 1;
        }
        public function drawCenter():void{
            var R:Number = 5;
            var r:Number = 3;
            _centerShape.graphics.lineStyle(1, 0x000000, 1);
            
            _centerShape.graphics.drawCircle(0, 0, R);
            _centerShape.graphics.beginFill(0x000000, 1);
            _centerShape.graphics.moveTo(0, 0);
            _centerShape.graphics.lineTo(0, -R);
            _centerShape.graphics.lineTo(R, 0);
            _centerShape.graphics.lineTo(0, 0);
            _centerShape.graphics.lineTo(-R, 0);
            _centerShape.graphics.lineTo(0, R);
            _centerShape.graphics.lineTo(0, 0);
            _centerShape.graphics.endFill();
        }
        public function moveCenter():void{
            _centerShape.x = centerX;
            _centerShape.y = centerY;
        }
        public function hideCenter():void{
            _centerShape.alpha = 0;
        }
        public function showCenter():void{
            _centerShape.alpha = 1;
        }
        public override function draw():void{
            super.draw();
            //this.drawPivot();
            this.drawCenter();
        }
        public function get pivotRotation():Number{
            return this.rotation;
        }
        public function set pivotRotation(degree : Number): void{
            if (this.rotation == degree) {
                return;
            }
            // come back to initial state first.
            this.rotation = 0;
            var matrix:Matrix = this.transform.matrix;
            var rect:Rectangle = this.getBounds(this.parent);

            matrix.translate(-(rect.left + this.pivotX), -(rect.top + this.pivotY));
            matrix.rotate(degree*Math.PI/180);
            matrix.translate((rect.left + this.pivotX), (rect.top + this.pivotY));
            this.transform.matrix = matrix;
        }
    }
}
