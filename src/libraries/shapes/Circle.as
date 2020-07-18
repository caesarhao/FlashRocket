package libraries.shapes
{
    import flash.display.Graphics;

    public class Circle extends ExtShape{
        private var _radius : Number;
        public function get radius():Number{
            return _radius;
        }
        public function Circle(radius: Number = 0){
            _radius = radius;
        }
        public override function drawOnTarget(target : Graphics, x : Number, y : Number):void{

        }
        public override function area():Number{
            return (Math.PI*Math.pow(radius, 2));
        }
        public override function perimeter():Number{
            return (2*Math.PI*radius);
        }
    }
}
