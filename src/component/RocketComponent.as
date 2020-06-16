//https://sprite.slicker.me/flash/tutorial.htm
package component{
    import flash.display.Sprite;
    import flash.display.GraphicsPathCommand;
    import flash.display.MovieClip;
    import flash.geom.Vector3D;
    public class RocketComponent extends Sprite{
        protected var _pivot : Vector.<uint>;
        protected var _weightKg : Number;
        public function RocketComponent(){
            _pivot = new Vector.<uint>(2, true);
            _pivot[0] = 0;
            _pivot[1] = 0;
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
        public function get weightKg():Number{
            return _weightKg;
        }
        public function draw():void{
            this.graphics.clear();
            
        }
    }
}
