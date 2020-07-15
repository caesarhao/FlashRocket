package libraries.shapes
{
    import flash.geom.Point;

    public class Triangle extends ExtShape{
        private var _points:Vector.<Point>;
        public function get points():Vector.<Point>{
            return _points;
        }
        public function Triangle(){
            _points = new Vector.<Point>(3, true);
        }
    }
}
