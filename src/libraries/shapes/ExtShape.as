package libraries.shapes
{
    import flash.display.Shape;
    import flash.display.Graphics;

    public class ExtShape extends Shape{
        public function drawOnTarget(target : Graphics, x : Number, y : Number):void{

        }
        public function draw():void{
            drawOnTarget(this.graphics, this.x, this.y);
        }
        public function area():Number{
            return 0;
        }
        public function perimeter():Number{
            return 0;
        }
    }
}
