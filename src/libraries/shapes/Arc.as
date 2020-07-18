package libraries.shapes
{
    import flash.display.Graphics;

    public class Arc extends ExtShape{
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
        public function Arc(radius: Number = 0, startAngle : Number = 0, angle : Number = 0){
            _radius = radius;
            _startAngle = startAngle;
            _angle = angle;
        }
        public override function drawOnTarget(target : Graphics, x : Number, y : Number):void{
            var segs : int = Math.ceil(this.angle/(Math.PI/4));
            var segs_floor : int = Math.floor(this.angle/(Math.PI/4));
            var ax : Number = x;
            var ay : Number = y;
            var bx : Number = x;
            var by : Number = y;
            var cx : Number = x;
            var cy : Number = y;
            for (var i : int = 0; i < segs_floor; i++){
                ax = x + radius * Math.cos(startAngle+i*(Math.PI/4));
                ay = y + radius * Math.sin(startAngle+i*(Math.PI/4));
                cx = x + radius * Math.cos(startAngle+i*(Math.PI/8));
                cy = y + radius * Math.sin(startAngle+i*(Math.PI/8));
                bx = x + radius * Math.cos(startAngle+(i+1)*(Math.PI/4));
                by = y + radius * Math.sin(startAngle+(i+1)*(Math.PI/4));
                target.moveTo(ax, ay);
                target.curveTo(cx, cy, bx, by);
            }
            if(segs_floor < segs){ // one additional seg smaller than PI/4.

            }
        }
        public override function area():Number{
            return 0;
        }
        public override function perimeter():Number{
            return (radius*angle);
        }
    }
}
