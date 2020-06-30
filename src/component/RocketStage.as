package component
{
    import component.engine.Engine;
    import coordinator.Coordinator;
    import flash.display.Shape;
    import flash.geom.Matrix;
    import flash.display.GradientType;
    import flash.display.SpreadMethod;
    import flash.display.InterpolationMethod;

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
            var currentY : Number = 0;
        /*
            for each (var j : Tank in _tanks){
                addChild(j);
                j.x = pivotX;
                j.y = currentY;
                currentY += j.heightInPixel;
            }
            for each (var i : Engine in _engs){
                addChild(i);
                //TODO
            }
            */
            drawShell();
            moveCenter();
        }
        private function drawShell():void{
            var matr:Matrix = new Matrix();
            matr.createGradientBox(diameterPixel, lengthPixel, 0, -diameterPixel/2, 0);
            _shellShape.graphics.beginGradientFill(GradientType.LINEAR,
                [0x606060, 0xFFFFFF, 0x606060], [1, 1, 1], [0, 127, 255], matr, 
                SpreadMethod.REFLECT, InterpolationMethod.RGB);
            _shellShape.graphics.drawRect(-diameterPixel/2, -lengthPixel/2, diameterPixel, lengthPixel);
            _shellShape.graphics.endFill();
        }
        public static function create_CZ_5_500() : RocketStage{
            var rs : RocketStage = new RocketStage(0, 02);
            //rs.name = "CZ-5-500";
            rs._diameterMeter = 5;
            rs._lengthMeter = 31.7;
            rs._shellWeightKg = 1600;
            // Add Tanks.
            //rs._tanks[0] = new Tank();
            //rs._tanks[1] = new Tank();
            // Add Engines.
            //rs._engs[0] = new Engine();
            //rs._engs[1] = new Engine();
            rs.draw();
            return rs;
        }
    }
}
