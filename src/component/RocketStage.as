package component
{
    import component.engine.Engine;
    import coordinator.Coordinator;

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
        private var _lengthMeter:Number;
        public function get lengthMeter():Number
        {
        	return _lengthMeter;
        }
        private var _diameterMeter:Number;

        public function get diameterMeter():Number
        {
        	return _diameterMeter;
        }
        private var _shellWeightKg:Number;

        public function get shellWeightKg():Number
        {
        	return _shellWeightKg;
        }
        public function RocketStage(){
            _engs = new Vector.<Engine>();
            _tanks = new Vector.<Tank>();
        }
        public override function get weightKg():Number
        {
            var weight : Number = shellWeightKg;
            for(var i : Engine in _engs){
                weight += i.weightKg;
            }
            for(var j : Tank in _tanks){
                weight += j.weightKg;
            }
        	return weight;
        }
        public override function draw():void{
            drawShell();
            var currentY : Number = 0;
            for(var j : Tank in _tanks){
                addChild(j);
                j.x = pivotX;
                j.y = currentY;
                currentY += j.heightInPixel;
            }
            for(var i : Engine in _engs){
                addChild(i);
                //TODO
            }
        }
        private function drawShell():void{

        }
        public static function createP120() : RocketStage{
            var rs : RocketStage = new RocketStage();
            rs.name = "P120";
            rs._diameterMeter = 3.7;
            rs._lengthMeter = 16;
            rs._shellWeightKg = 500;
            rs._pivot[0] = rs._diameterMeter/2 * Coordinator.MeterperPixel;
            rs._pivot[1] = rs._lengthMeter/2 * Coordinator.MeterperPixel;
            rs.draw();
            return rs;
        }
    }
}
