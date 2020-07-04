package libraries
{
    import flash.display.Graphics;
    import flash.display.GraphicsPathCommand;

    public class RegularPolygon{
        public static function drawRegPolygon(target : Graphics, x : Number, y : Number, radius : Number, nEdges : int, initAngle : Number = Math.PI/(-2)):void{
            var deltAngle : Number = 2*Math.PI/nEdges;
            var commands : Vector.<int> = new Vector.<int>((nEdges + 1), true);
            var coords : Vector.<Number> = new Vector.<Number>(2*(nEdges + 1), true);
            for(var i : int = 0; i < (nEdges+1); i++){
                commands[i] = GraphicsPathCommand.LINE_TO;
                coords[2*i] = x+radius*Math.cos(initAngle+deltAngle*i); // x
                coords[2*i+1] = y+radius*Math.sin(initAngle+deltAngle*i); // y
            }
            commands[0] = GraphicsPathCommand.MOVE_TO;
            target.drawPath(commands, coords);
        }
    }
}
