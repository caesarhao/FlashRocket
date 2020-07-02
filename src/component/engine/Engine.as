//https://sprite.slicker.me/flash/tutorial.htm
package component.engine{
    import flash.display.GradientType;
    import flash.display.SpreadMethod;
    import flash.display.GraphicsPathCommand;
    import component.RocketComponent;
    import flash.geom.Matrix;
    import coordinator.Coordinator;
    public class Engine extends RocketComponent{
        private var _height_M : Number = 0;
        private var _diameter_M : Number = 0;
        protected var _nChambers: int;
        protected var _nozzleRatio: Number;
        protected var _chamberPressure_Pa: Number;
        protected var _thrustSL_N: Number;
        protected var _thrustVAC_N: Number;
        protected var _specificImpulseSL_S: Number;
        protected var _specificImpulseVAC_S: Number;
        public function Engine(){
            this.center.x = 50;
            this.center.y = 40;
            this.pivot.x = 0;
            this.pivot.y = 0;
        }
        public function get height_M():Number{
            return _height_M;
        }
        public function get height_Px():Number{
            return height_M*Coordinator.PixelperMeter;
        }
        public function get diameter_M():Number{
            return _diameter_M;
        }
        public function get diameter_Px():Number{
            return diameter_M*Coordinator.PixelperMeter;
        }
        public function get nChambers():int{
            return _nChambers;
        }
        public function get nozzleRatio():Number{
            return _nozzleRatio;
        }
        public function get thrustSL_N():Number{
            return _thrustSL_N;
        }
        public function get thrustVAC_N():Number{
            return _thrustVAC_N;
        }
        public function get specificImpulseSL_S():Number{
            return _specificImpulseSL_S;
        }
        public function get specificImpulseVAC_S():Number{
            return _specificImpulseVAC_S;
        }
        public override function draw():void{
            super.draw();
            var matr:Matrix = new Matrix();
            matr.createGradientBox(10, 10, Math.PI / 2, 0, 0);
            this.graphics.beginGradientFill(GradientType.LINEAR,[0xFF0000, 0x0000FF], [1, 1], [0x00, 0xFF], matr, SpreadMethod.REFLECT);
            this.graphics.drawRect(-this.diameter_Px/2, 0, this.diameter_Px, this.height_Px);
            this.graphics.endFill();
            //moveCenter();
        }
        public static function create_YF_77():Engine{
            var eng : Engine = new Engine();
            eng._height_M = 4.2;
            eng._diameter_M = 1.446;
            eng._chamberPressure_Pa = 10.2e6; // 10.2 MPa
            eng._nChambers = 1;
            eng._nozzleRatio = 49;
            eng._specificImpulseSL_S = 310;
            eng._specificImpulseVAC_S = 427.71;
            eng._thrustSL_N = 509.6e3;
            eng._thrustVAC_N = 700e3;
            eng._weightKg = 2750; // kg
            eng._edge.left = -eng.diameter_Px/2;
            eng._edge.top = 0;
            eng._edge.width = eng.diameter_Px;
            eng._edge.height = eng.height_Px;
            return eng;
        }
    }
}
