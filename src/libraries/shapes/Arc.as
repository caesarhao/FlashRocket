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
            var eachSeg : Number = Math.PI/4;
            if (angle < 0){ // for minus angle
                eachSeg = 0 - eachSeg;
            }
            var segs : int = Math.ceil(angle/eachSeg);
            var segs_floor : int = Math.floor(angle/eachSeg);
            var factor : Number = 2.0 - Math.cos(eachSeg/2);
            var ax : Number = x;
            var ay : Number = y;
            var bx : Number = x;
            var by : Number = y;
            var cx : Number = x;
            var cy : Number = y;
            for (var i : int = 0; i < segs_floor; i++){
                ax = x + radius * Math.cos(startAngle+i*eachSeg);
                ay = y + radius * Math.sin(startAngle+i*eachSeg);
                cx = x + factor * radius * Math.cos(startAngle+(0.5+i)*eachSeg);
                cy = y + factor * radius * Math.sin(startAngle+(0.5+i)*eachSeg);
                bx = x + radius * Math.cos(startAngle+(i+1)*eachSeg);
                by = y + radius * Math.sin(startAngle+(i+1)*eachSeg);
                target.moveTo(ax, ay);
                target.curveTo(cx, cy, bx, by);
            }
            if(segs_floor < segs){ // one additional seg smaller than eachSeg.
                var lastSeg : Number = angle - eachSeg*segs_floor;
                factor = 2.0 - Math.cos(lastSeg/2);
                ax = x + radius * Math.cos(startAngle+segs_floor*eachSeg);
                ay = y + radius * Math.sin(startAngle+segs_floor*eachSeg);
                cx = x + factor * radius * Math.cos(startAngle+segs_floor*eachSeg+lastSeg/2);
                cy = y + factor * radius * Math.sin(startAngle+segs_floor*eachSeg+lastSeg/2);
                bx = x + radius * Math.cos(startAngle+angle);
                by = y + radius * Math.sin(startAngle+angle);
                target.moveTo(ax, ay);
                target.curveTo(cx, cy, bx, by);
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
