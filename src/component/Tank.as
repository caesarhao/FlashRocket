package component
{
    public class Tank extends RocketComponent{
        protected var _fillingRatio:Number;
        public function Tank(){

        }
        public function get fillingRatio():Number
        {
        	return _fillingRatio;
        }

    }
}
