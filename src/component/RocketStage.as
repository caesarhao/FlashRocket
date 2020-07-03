package component
{
    import component.engine.Engine;
    import coordinator.Coordinator;
    import flash.display.Shape;
    import flash.geom.Matrix;
    import flash.display.GradientType;
    import flash.display.SpreadMethod;
    import flash.display.InterpolationMethod;
    import propellant.PropellantType;

    public class RocketStage extends RocketComponent{
        private var _engs:Vector.<Engine>;
        private function get engs():Vector.<Engine>
        {
        	return _engs;
        }
        private var _tanks:Vector.<Tank>;
        public function get tanks():Vector.<Tank>
        {
        	return _tanks;
        }
        protected var _shellShape : Shape;
        private var _lengthMeter:Number;
        public function get lengthMeter():Number
        {
        	return _lengthMeter;
        }
        public function get lengthPixel():Number
        {
            return _lengthMeter*Coordinator.PixelperMeter;
        }
        private var _diameterMeter:Number;
        public function get diameterMeter():Number
        {
        	return _diameterMeter;
        }
        public function get diameterPixel():Number
        {
            return _diameterMeter*Coordinator.PixelperMeter;
        }
        private var _shellWeightKg:Number;

        public function get shellWeightKg():Number
        {
        	return _shellWeightKg;
        }
        public function get maxEngHeightM():Number{
            var ret : Number = 0;
            for each(var eng:Engine in _engs)
            {
                if (eng != null && eng.height_M > ret){
                    ret = eng.height_M;
                }
            }
            return ret;
        }
        public function get maxEngHeightPx():Number{
            return maxEngHeightM*Coordinator.PixelperMeter;
        }
        public function RocketStage(engNum:uint = 0, tankNum:uint = 0){
            _shellShape = new Shape();
            addChild(_shellShape);
            _engs = new Vector.<Engine>(engNum, false);
            _tanks = new Vector.<Tank>(tankNum, false);
        }
        public override function get weightKg():Number
        {
            _weightKg = shellWeightKg;
            for each (var i : Engine in _engs){
                _weightKg += i.weightKg;
            }
            for each (var j : Tank in _tanks){
                _weightKg += j.weightKg;
            }
        	return _weightKg;
        }
        public override function draw():void{
            super.draw();
            var X : Number = this.left;
            var Y : Number = this.top + 10;
        
            for each (var j : Tank in _tanks){
                j.draw();
                addChild(j);
                j.x = X + (this.diameterPixel-j.diameterInPixel)/2;
                j.y = Y;
                Y += (j.heightInPixel + 5);
            }
            Y = this.bottom - this.maxEngHeightPx;
            X = this.left;
            var sumEngsWids : Number = 0;
            for each(var en : Engine in _engs){
                sumEngsWids += en.diameter_Px;
            }
            var delt : Number = (this.size.x - sumEngsWids)/(_engs.length-1);
            
            for each (var i : Engine in _engs){
                i.draw();
                addChild(i);
                i.x = X;
                i.y = Y;
                X += delt;
            }
            
            drawShell();
            //moveCenter();
        }
        private function drawShell():void{
            var lenPxWoEng:Number = lengthPixel - maxEngHeightPx;
            var delt : Number = 10;
            var matr:Matrix = new Matrix();
            matr.createGradientBox(diameterPixel, delt, 0, -diameterPixel/2, 0);
            _shellShape.graphics.beginGradientFill(GradientType.LINEAR,
                [0x0000FF, 0xFFFFFF, 0x0000FF], [1, 1, 1], [0, 127, 255], matr, 
                SpreadMethod.REFLECT, InterpolationMethod.RGB);
            _shellShape.graphics.drawRect(-diameterPixel/2, -lengthPixel/2, diameterPixel, delt);
            _shellShape.graphics.endFill();
            matr.createGradientBox(diameterPixel, lenPxWoEng-delt, 0, -diameterPixel/2, 0);
            _shellShape.graphics.beginGradientFill(GradientType.LINEAR,
                [0x606060, 0xFFFFFF, 0x606060], [1, 1, 1], [0, 127, 255], matr, 
                SpreadMethod.REFLECT, InterpolationMethod.RGB);
            _shellShape.graphics.drawRect(-diameterPixel/2, -lengthPixel/2+delt, diameterPixel, lenPxWoEng-delt);
            _shellShape.graphics.endFill();
        }
        public static function create_CZ_5_500() : RocketStage{
            var rs : RocketStage = new RocketStage(2, 2);
            //rs.name = "CZ-5-500";
            rs._diameterMeter = 5;
            rs._lengthMeter = 31.7;
            rs._edge.left = -rs.diameterPixel/2;
            rs._edge.top = -rs.lengthPixel/2;
            rs._edge.width = rs.diameterPixel;
            rs._edge.height = rs.lengthPixel;
            rs._shellWeightKg = 1600;
            // Add Tanks.
            rs._tanks[0] = new Tank(PropellantType.LOX,  8, 4);
            rs._tanks[1] = new Tank(PropellantType.LH2, 16, 4);
            // Add Engines.
            rs._engs[0] = Engine.create_YF_77();
            rs._engs[1] = Engine.create_YF_77();
            rs.draw();
            rs._shellShape.alpha = 0.3;
            return rs;
        }
    }
}
