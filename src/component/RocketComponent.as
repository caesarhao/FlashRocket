
package component{
    import flash.display.Sprite;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.display.Shape;
    public class RocketComponent extends Component{
        protected var _weightKg:Number;
        
        public function get weightKg():Number
        {
        	return _weightKg;
        }
        
        public function RocketComponent(weightKg : Number = 0){
            _weightKg = weightKg;
        }
         
        public override function draw():void{
            super.draw();
        }
        
    }
}
