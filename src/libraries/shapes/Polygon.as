package libraries.shapes
{
    import flash.display.Graphics;
    import flash.geom.Point;

    public class Polygon extends ExtShape{
        private var _vertices:Vector.<Point>;
        public function get vertices():Vector.<Point>{
            return _vertices;
        }
        public function Polygon(numEdges : int = 3){
            _vertices = new Vector.<Point>(numEdges, false);
        }
        public override function drawOnTarget(target : Graphics, x : Number, y : Number):void{
            target.moveTo(vertices[vertices.length-1].x + x, vertices[vertices.length-1].y + y);
            for (var i : int = 0; i < vertices.length; i++){
                target.lineTo(vertices[i].x + x, vertices[i].y + y);
            }
        }
        public override function area():Number{
            var ret : Number = 0;
            for (var i : int = 0; i < vertices.length; i++){
                ret += (vertices[i].x * vertices[(i+1)%(vertices.length)].y - vertices[(i+1)%(vertices.length)].x * vertices[i].y);
            }
            ret /= 2;
            return ret;
        }
        public override function perimeter():Number{
            var ret : Number = 0;
            for (var i : int = 0; i < vertices.length; i++){
                ret += Point.distance(vertices[i], vertices[(i+1)%(vertices.length)]);
            }
            return ret;
        }
    }
}
