package libraries.shapes
{
    import flash.geom.Point;
    import flash.display.Graphics;

    public class Segment extends ExtShape{
        private var _points:Vector.<Point>;
        public function get points():Vector.<Point>{
            return _points;
        }
        public function Segment(x1 : Number = 0, y1 : Number = 0, x2 : Number = 0, y2 : Number = 0){
            _points = new Vector.<Point>(2, true);
            points[0].x = x1;
            points[0].y = y1;
            points[1].x = x2;
            points[1].y = y2;
        }
        public override function drawOnTarget(target : Graphics, x : Number, y : Number):void{
            target.moveTo(points[0].x, points[0].y);
            target.lineTo(points[1].x, points[1].y);
        }
        public override function area():Number{
            return 0;
        }
        public override function perimeter():Number{
            return Point.distance(points[0], points[1]);
        }
    }
}
