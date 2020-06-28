//https://sprite.slicker.me/flash/tutorial.htm
package component.engine{
    import flash.display.GradientType;
    import flash.display.SpreadMethod;
    import flash.display.GraphicsPathCommand;
    import component.RocketComponent;
    import flash.geom.Matrix;
    public class Engine extends RocketComponent{
        protected var _nChambers: int;
        protected var _nozzleRatio: Number;
        protected var _chamberPressure_Pa: Number;
        protected var _thrustSL_N: Number;
        protected var _thrustVAC_N: Number;
        protected var _specificImpulseSL_S: Number;
        protected var _specificImpulseVAC_S: Number;
        public function Engine(){
            this.center.x = this.x + this.width/2;
            this.center.y = this.y + this.height/2;
            this.pivot.x = this.centerX;
            this.pivot.y = this.centerY;
            setChildIndex(_pivotShape, this.numChildren-1);
            draw();
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
            this.graphics.drawRoundRect(-100, -50, 200, 100, 50);
            this.graphics.endFill();
        }
    }
}
