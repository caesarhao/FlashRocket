//https://sprite.slicker.me/flash/tutorial.htm
package component.engine{
    import flash.display.Sprite;
    public class Engine extends Sprite{
        protected var name: String;
        protected var nChambers: int;
        protected var nozzleRatio: Number;
        protected var chamberPressure: Number;
        protected var thrust: Number;
        protected var specificImpulse: Number;
        public function Engine(){
        }
        public function get Name():String{
            return name;
        }
        public function get NChambers():int{
            return nChambers;
        }
        public function get NozzleRatio():Number{
            return nozzleRatio;
        }
        public function get Thrust():Number{
            return thrust;
        }
        public function get SpecificImpulse():Number{
            return specificImpulse;
        }
    }
}
