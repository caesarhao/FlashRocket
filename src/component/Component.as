
package component{
    import flash.display.Sprite;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.display.Shape;
    public class Component extends Sprite{
        public static var DEBUG : Boolean = true;
        protected var _edge : Rectangle;
        public function get edge() : Rectangle{
            return this._edge;
        }
        public function get top(): Number{
            return _edge.top;
        }
        public function get bottom(): Number{
            return _edge.bottom;
        }
        public function get left(): Number{
            return _edge.left;
        }
        public function get right(): Number{
            return _edge.right;
        }
        public function get topLeft(): Point{
            return _edge.topLeft;
        }
        public function get bottomRight(): Point{
            return _edge.bottomRight;
        }
        public function get Width() : Number{
            return _edge.width;
        }
         public function get Height() : Number{
            return _edge.height;
        }
        public function get size():Point{
            return _edge.size;
        }
        public function get center():Point{
            return new Point((edge.left + edge.width/2), (edge.top + edge.height/2));
        }
        public function get centerX():Number{
            return center.x;
        }
        public function get centerY():Number{
            return center.y;
        }
        protected var _pivot:Point;
        public function get pivot():Point
        {
        	return _pivot;
        }
        public function set pivot(val : Point):void
        {
        	_pivot.copyFrom(val);
            movePivot();
        }
        public function get pivotX():Number
        {
        	return pivot.x;
        }
        public function set pivotX(val : Number): void{
            _pivot.x = val;
            movePivot();
        }
        public function get pivotY():Number
        {
        	return pivot.y;
        }
        public function set pivotY(val : Number): void{
            _pivot.y = val;
            movePivot();
        }
        protected var _centerShape : Shape;
        protected var _pivotShape : Shape;
        public function Component(){
            _edge = new Rectangle();
            _edge.left = 0;
            _edge.top = 0;
            _centerShape = new Shape();
            addChild(_centerShape);
            _pivot = new Point(0, 0);
            _pivotShape = new Shape();
            addChild(_pivotShape);
        }
        public function drawEdge():void{
            if(DEBUG){
                graphics.lineStyle(1, 0xFF0000, 1);
            }
            else{
                graphics.lineStyle(1, 0xFF0000, 0);
            }
            graphics.drawRect(_edge.left+0, _edge.top+0, _edge.width, _edge.height);
        }
        protected function drawCenter():void{
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
        protected function drawPivot():void{
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
        public function movePivot():void{
            _pivotShape.x = pivotX;
            _pivotShape.y = pivotY; 
        }
        public function hidePivot():void{
            _pivotShape.alpha = 0;
        }
        public function showPivot():void{
            _pivotShape.alpha = 1;
        }
        public function draw():void{
            this.graphics.clear();
            this.drawEdge();
        }
        public function drawEnd():void{
            this.drawCenter();
            this.moveCenter();
            this.drawPivot();
            this.movePivot();
            //setChildIndex(_pivotShape, this.numChildren-1);
            //setChildIndex(_centerShape, this.numChildren-1);
        }
        public function get centerRotation():Number{
            return this.rotation;
        }
        public function set centerRotation(degree : Number): void{
            this.rotation = degree;
            return;
        }
        public function set centerRotationWrong(degree : Number): void{
            if (this.rotation == degree) {
                return;
            }
            var matrix:Matrix = this.transform.matrix;
            var rect:Rectangle = this.getBounds(this.parent);

            matrix.translate(-(rect.left + (rect.width / 2)), -(rect.top + (rect.height / 2)));
            matrix.rotate((degree / 180) * Math.PI);
            matrix.translate(rect.left + (rect.width / 2), rect.top + (rect.height / 2));
            this.transform.matrix = matrix;
            this.rotation = Math.round(this.rotation);
        }
        public function get pivotRotation():Number{
            return this.rotation;
        }
        public function set pivotRotationOld(degree : Number): void{
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
        public function set pivotRotation(degree : Number): void{
            if (this.rotation == degree) {
                return;
            }
            // come back to initial state first.
            this.rotation = 0;
            this.x += (pivotX - centerX);
            this.y += (pivotY - centerY);
            this.rotation = degree;
            var dist:Number = Point.distance(pivot, center);
            this.x += dist*Math.cos((degree*Math.PI/180));
            this.y += dist*Math.sin((degree*Math.PI/180));
        }
    }
}
