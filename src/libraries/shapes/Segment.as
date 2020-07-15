package libraries.shapes
{
    import flash.geom.Point;

    public class Segment extends ExtShape{
        private var _points:Vector.<Point>;
        public function get points():Vector.<Point>{
            return _points;
        }
        public function Segment(){
            _points = new Vector.<Point>(2, true);
        }
    }
}
