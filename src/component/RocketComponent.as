//https://sprite.slicker.me/flash/tutorial.htm
package component{
    import flash.display.Sprite;
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
    }
}
