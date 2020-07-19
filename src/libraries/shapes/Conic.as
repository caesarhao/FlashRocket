package libraries.shapes
{
    import flash.geom.Point;

    public class Conic extends ExtShape{
        private var _foci : Vector.<Point>;
        public function get foci():Vector.<Point>{
            return _foci;
        }
        private var _eccentricity : Number;
        public function get eccentricity():Number{
            return _eccentricity;
        }
        public function Conic(){
            _foci = new Vector.<Point>(2, true);
        }
    }
}
