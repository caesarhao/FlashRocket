package libraries.shapes
{
    import flash.display.Graphics;

    public class RectangleExt extends ExtShape{
        private var _widz : Number;
        public function get widz():Number{
            return _widz;
        }
        private var _heiz : Number;
        public function get heiz():Number{
            return _heiz;
        }
        public function RectangleExt(w : Number = 0, h : Number = 0){
            _widz = w;
            _heiz = h;
        }
        public override function drawOnTarget(target : Graphics, x : Number, y : Number):void{
            target.drawRect(x-widz/2, y-heiz/2, widz, heiz);
        }
        public override function area():Number{
            return (widz*heiz);
        }
        public override function perimeter():Number{
            return ((widz+heiz)*2);
        }
    }
}
