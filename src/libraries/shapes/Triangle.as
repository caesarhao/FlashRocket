package libraries.shapes
{
    import flash.geom.Point;
    import flash.display.Graphics;
    import spark.components.VGroup;

    public class Triangle extends ExtShape{
        private var _vertices:Vector.<Point>;
        public function get vertices():Vector.<Point>{
            return _vertices;
        }
        public function Triangle(){
            _vertices = new Vector.<Point>(3, true);
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
                ret += vertices[i].x * (vertices[(i+1)%(vertices.length)].y - vertices[(i+2)%(vertices.length)].y);
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
