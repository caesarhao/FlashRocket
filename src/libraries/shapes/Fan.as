package libraries.shapes
{
    import flash.display.Graphics;

    public class Fan extends ExtShape{
        private var _radius : Number;
        public function get radius():Number{
            return _radius;
        }
        private var _startAngle : Number;
        public function get startAngle() : Number{
            return _startAngle;
        }
        private var _angle : Number;
        public function get angle() : Number{
            return _angle;
        }
        public function Fan(radius: Number = 0, startAngle : Number = 0, angle : Number = 0){
            _radius = radius;
            _startAngle = startAngle;
            _angle = angle;
        }
        public override function drawOnTarget(target : Graphics, x : Number, y : Number):void{

        }
        public override function area():Number{
            return (0.5*angle*Math.pow(radius, 2));
        }
        public override function perimeter():Number{
            return (radius*(angle+2));
        }
    }
}
