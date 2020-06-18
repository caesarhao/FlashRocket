package component
{
    import flash.display.Shape;
    import flash.display.Graphics;
    import component.propellant.Propellant;

    public class Tank extends RocketComponent{
        private var _propellantType:int;
        private var _propellantShape : Shape;
        private var _fillingShape : Shape;
        public function get propellantType():int
        {
        	return _propellantType;
        }
        private var _fillingRatio:Number;
        private var _heightInMeter:Number;

        public function get heightInMeter():Number
        {
        	return _heightInMeter;
        }
        public function get heightInPixel():Number
        {
        	return Math.round(_heightInMeter*PixelperMeter);
        }
        private var _diameterInMeter:Number;

        public function get diameterInMeter():Number
        {
        	return _diameterInMeter;
        }
        public function get diameterInPixel():Number
        {
        	return Math.round(_diameterInMeter*PixelperMeter);
        }
        public function Tank(propellantType: int, heightInMeter : Number, diameterInMeter:Number, fillingRatio:Number = 1){
            _propellantShape = new Shape();
            addChild(_propellantShape);
            _fillingShape = new Shape();
            addChild(_fillingShape);
            _propellantShape.mask = _fillingShape;
            _propellantType = propellantType;
            _heightInMeter = heightInMeter;
            _diameterInMeter = diameterInMeter;
            _fillingRatio = fillingRatio;
            this.pivot[0] = diameterInPixel/2;
            this.pivot[1] = heightInPixel/2;
            draw();
        }
        public function get fillingRatio():Number
        {
        	return _fillingRatio;
        }
        protected function set fillingRatio(value:Number):void
        {
        	_fillingRatio = value;
             _fillingShape.y = (1-_fillingRatio)*heightInPixel;
        }
        public override function draw():void{
            this.graphics.clear();
            this.drawTank();
            this.drawPropellant();
            this.drawFilling();
        }
        private function drawCoque(target:Graphics):void{
            target.moveTo(0, pivotX);
            target.cubicCurveTo(pivotX/2, 0, pivotX*3/2, 0, diameterInPixel, pivotX);
            target.lineTo(diameterInPixel, heightInPixel-pivotX);
            target.cubicCurveTo(pivotX*3/2, heightInPixel, pivotX/2, heightInPixel, 0, heightInPixel-pivotX);
            target.lineTo(0, pivotX);
        }
        private function drawTank():void{
            this.graphics.lineStyle(2, 0x000000, 1);
            this.drawCoque(this.graphics);
        }
        private function drawPropellant():void{
            _propellantShape.graphics.beginFill(Propellant.propellant(_propellantType).colorRGB, 1);
            this.drawCoque(_propellantShape.graphics);
            _propellantShape.graphics.endFill();
        }
        private function drawFilling():void{
            _fillingShape.graphics.beginFill(0x000000, 1);
            _fillingShape.graphics.drawRect(0,0,diameterInPixel,heightInPixel);
            _fillingShape.graphics.endFill();
            _fillingShape.y = (1-_fillingRatio)*heightInPixel;
        }
    }
}
