// https://checalc.com/calc/vessel.html
// Elliptical Head is used.
package component
{
    import flash.display.Shape;
    import flash.display.Graphics;
    import propellant.Propellant;
    import coordinator.Coordinator;
    import flash.events.Event;
    import flash.text.TextField;

    public class Tank extends RocketComponent{
        private var _propellantType:int;
        private var _propellantShape : Shape;
        private var _fillingShape : Shape;
        public function get propellantType():int
        {
        	return _propellantType;
        }
        private var _fillingRatio:Number;
        private var _fillingRatioText : TextField;
        private var _heightInMeter:Number;

        public function get heightInMeter():Number
        {
        	return _heightInMeter;
        }
        public function get heightInPixel():Number
        {
        	return Math.round(_heightInMeter*Coordinator.PixelperMeter);
        }
        private var _diameterInMeter:Number;

        public function get diameterInMeter():Number
        {
        	return _diameterInMeter;
        }
        public function get diameterInPixel():Number
        {
        	return Math.round(_diameterInMeter*Coordinator.PixelperMeter);
        }
        public function get volumeM3() : Number{
            //return Math.PI*Math.pow(diameterInMeter/2, 2)*(heightInMeter-diameterInMeter)+4/3*Math.PI*Math.pow(diameterInMeter/2, 3);
            return Math.PI*Math.pow(diameterInMeter/2, 2)*(heightInMeter-diameterInMeter/2)+2*1/24*Math.PI*Math.pow(diameterInMeter, 3);
        }
        private var _shellWeightKg:Number;
        public function get shellWeightKg():Number
        {
        	return _shellWeightKg;
        }
        public function Tank(propellantType: int, heightInMeter : Number, diameterInMeter:Number, fillingRatio:Number = 1){
            _propellantShape = new Shape();
            addChild(_propellantShape);
            _fillingShape = new Shape();
            addChild(_fillingShape);
            _fillingRatioText = new TextField();
            addChild(_fillingRatioText);

            _propellantShape.mask = _fillingShape;
            _propellantType = propellantType;
            _heightInMeter = heightInMeter;
            _diameterInMeter = diameterInMeter;
            _fillingRatio = fillingRatio;
            _shellWeightKg = 0;
            _edge.left = 0;
            _edge.top = 0;  
            _edge.width = diameterInPixel;
            _edge.height = heightInPixel;
            this.pivot.x = this.left;
            this.pivot.y = this.top;
            //setChildIndex(_pivotShape, this.numChildren-1);
            //setChildIndex(_centerShape, this.numChildren-1);
            
        }
        public function get fillingRatio():Number
        {
        	return _fillingRatio;
        }
        public function set fillingRatio(value:Number):void
        {
        	_fillingRatio = value;
            if (0 > _fillingRatio){
                _fillingRatio = 0;
            }
            if (1 < _fillingRatio){
                _fillingRatio = 1;
            }
             _fillingShape.y = (1-_fillingRatio)*heightInPixel;
            _fillingShape.height = _fillingRatio*heightInPixel;
            _fillingRatioText.text = "" + Math.ceil(_fillingRatio*100) + "%";
        }
        public override function get weightKg():Number
        {
        	return _shellWeightKg + Propellant.propellant(_propellantType).densityKgM_3*volumeM3;
        }
        public override function draw():void{
            super.draw();
            this.drawTank();
            this.drawPropellant();
            this.drawFilling();
            this.drawEnd();
        }
        private function drawShell(target:Graphics):void{
            target.moveTo(0, diameterInPixel/4);
            target.cubicCurveTo(diameterInPixel/4, -diameterInPixel/10, 3*diameterInPixel/4, -diameterInPixel/10, diameterInPixel, diameterInPixel/4);
            target.lineTo(diameterInPixel, heightInPixel-diameterInPixel/4);
            target.cubicCurveTo(diameterInPixel/4*3, heightInPixel+diameterInPixel/10, diameterInPixel/4, heightInPixel+diameterInPixel/10, 0, heightInPixel-diameterInPixel/4);
            target.lineTo(0, diameterInPixel/4);
        }
        private function drawTank():void{
            this.graphics.lineStyle(2, 0x000000, 1);
            this.drawShell(this.graphics);
        }
        private function drawPropellant():void{
            _propellantShape.graphics.beginFill(Propellant.propellant(_propellantType).colorRGB, 1);
            this.drawShell(_propellantShape.graphics);
            _propellantShape.graphics.endFill();
        }
        private function drawFilling():void{
            _fillingShape.graphics.beginFill(0x000000, 1);
            _fillingShape.graphics.drawRect(0,0,diameterInPixel,heightInPixel*_fillingRatio);
            _fillingShape.graphics.endFill();
            _fillingShape.y = (1-_fillingRatio)*heightInPixel;
            _fillingRatioText.text = "100%";
            _fillingRatioText.x = this.left + (this.Width - _fillingRatioText.textWidth)/2;
            _fillingRatioText.y = this.top + (this.Height - _fillingRatioText.textHeight)/2;
            _fillingRatioText.text = "" + Math.ceil(_fillingRatio*100) + "%";
        }

    }
}
