package component
{
    public class Tank extends RocketComponent{
        protected var _fillingRatio:Number;
        public function Tank(){
            _fillingRatio = 0;
            draw();
        }
        public function get fillingRatio():Number
        {
        	return _fillingRatio;
        }
        public override function draw():void{
            this.graphics.clear();
            this.graphics.beginFill(0x0000EE, 1);
            this.graphics.drawCircle(100, 100-50, 20);
            this.graphics.drawRect(100-20, 100-50, 40, 100);
            this.graphics.drawCircle(100, 100+50, 20);
            this.graphics.endFill();
        }
    }
}
