//https://sprite.slicker.me/flash/tutorial.htm
package component{
    import flash.display.Sprite;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    public class RocketComponent extends Sprite{
        private var _weightKg:Number;
        public function get weightKg():Number
        {
        	return _weightKg;
        }
        protected var _pivot : Vector.<uint>;
        public function get pivot():Vector.<uint>{
            return _pivot;
        }
        public function get pivotX():uint{
            return pivot[0];
        }
        public function get pivotY():uint{
            return pivot[1];
        }
        public function RocketComponent(weightKg : Number = 0){
            _pivot = new Vector.<uint>(2, true);
            _pivot[0] = 0;
            _pivot[1] = 0;
            _weightKg = weightKg;
        }
        public function draw():void{
            this.graphics.clear();
        }
        public function get pivotRotation():Number{
            return this.rotation;
        }
        public function set pivotRotation(degree : Number): void{
            if (this.rotation == degree) {
                return;
            }
            this.pivot[0] = this.width/2;
            this.pivot[1] = this.height/2;
            degree -= this.rotation;
            var matrix:Matrix = this.transform.matrix;
            var rect:Rectangle = this.getBounds(this.parent);

            matrix.translate(-(rect.left + (rect.width / 2)), -(rect.top + (rect.height / 2)));
            matrix.rotate(degree*Math.PI/180);
            matrix.translate(rect.left + (rect.width / 2), rect.top + (rect.height / 2));
            this.transform.matrix = matrix;
            //this.rotation = Math.round(this.rotation);

        }
    }
}
