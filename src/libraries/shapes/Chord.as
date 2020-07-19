package libraries.shapes
{
    import flash.display.Graphics;

    public class Chord extends ExtShape{
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
        public function Chord(radius: Number = 0, startAngle : Number = 0, angle : Number = 0){
            _radius = radius;
            _startAngle = startAngle;
            _angle = angle;
        }
        public override function drawOnTarget(target : Graphics, x : Number, y : Number):void{
            new Arc(radius, startAngle, angle).drawOnTarget(target, x, y);
            target.moveTo((x+radius*Math.cos(startAngle+angle)), (y+radius*Math.sin(startAngle+angle)));
            target.lineTo((x+radius*Math.cos(startAngle)), (y+radius*Math.sin(startAngle)));
        }
        public override function area():Number{
            return ((0.5*angle*Math.pow(radius, 2))-(0.5*Math.sin(angle)*Math.pow(radius, 2)));
        }
        public override function perimeter():Number{
            return (radius*(angle+2*Math.sin(angle/2)));
        }
    }
}
