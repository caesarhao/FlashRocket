//https://sprite.slicker.me/flash/tutorial.htm
package component{
    import flash.display.Sprite;
    import flash.display.GraphicsPathCommand;
    import flash.display.MovieClip;
    import flash.geom.Vector3D;
    public class RocketComponent extends Sprite{
        private static var _PixelperMeter:Number;
        public static function get PixelperMeter():Number
        {
        	return _PixelperMeter;
        }
        public static function get MeterperPixel():Number
        {
        	return (1/_PixelperMeter);
        }
        private static function set PixelperMeter(value:Number):void
        {
        	_PixelperMeter = value;
        }
        protected var _pivot : Vector.<uint>;
        public function RocketComponent(){
            _pivot = new Vector.<uint>(2, true);
            _pivot[0] = 0;
            _pivot[1] = 0;
            _PixelperMeter = 10;
        }
        public function get pivot():Vector.<uint>{
            return _pivot;
        }
        public function get pivotX():uint{
            return pivot[0];
        }
        public function get pivotY():uint{
            return pivot[1];
        }
        public function draw():void{
            this.graphics.clear();
        }
    }
}
