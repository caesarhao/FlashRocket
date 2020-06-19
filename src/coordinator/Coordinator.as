package coordinator
{
    public class Coordinator{
        private static var _PixelperMeter:Number;
        private static var _main : Main;
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
        public static function get main():Main{
            return _main;
        }
        public static function get frameRate():Number{
            return _main.stage.frameRate;
        }
        public static function set frameRate(value : Number):void{
            _main.stage.frameRate = value;
        }
        public function Coordinator(main : Main){
            _PixelperMeter = 10;
            _main = main;
        }
    }
}
