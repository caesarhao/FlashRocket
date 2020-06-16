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
            this.pivot[0] = 100;
            this.pivot[1] = 100;
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
            this.graphics.clear();
            //this.graphics.beginFill(0xFF0000, 1);
            var matr:Matrix = new Matrix();
            matr.createGradientBox(10, 10, Math.PI / 2, 0, 0);
            this.graphics.beginGradientFill(GradientType.LINEAR,[0xFF0000, 0x0000FF], [1, 1], [0x00, 0xFF], matr, SpreadMethod.REFLECT);
            var path_commands:Vector.<int> = new Vector.<int>(4, true);
            
            path_commands[0] = GraphicsPathCommand.MOVE_TO;
            path_commands[1] = GraphicsPathCommand.LINE_TO;
            path_commands[2] = GraphicsPathCommand.LINE_TO;
            path_commands[3] = GraphicsPathCommand.LINE_TO;
            
            var path_data:Vector.<Number> = new Vector.<Number>(8, true);
            path_data[0] = 100; //x
            path_data[1] = 100; //y 
            path_data[2] = 100-20; 
            path_data[3] = 100+40; 
            path_data[4] = 100+20; 
            path_data[5] = 100+40; 
            path_data[6] = 100; 
            path_data[7] = 100; 
            this.graphics.drawPath(path_commands, path_data);
            this.graphics.endFill();
        }
    }
}
