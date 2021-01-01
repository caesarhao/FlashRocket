
package component{
    import flash.display.Sprite;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.display.Shape;
    public class Component extends Sprite{
        public static var DEBUG : Boolean = true;
        protected var _edge : Rectangle;
        public function get edge() : Rectangle{
            return this._edge;
        }
        public function get top(): Number{
            return _edge.top;
        }
        public function get bottom(): Number{
            return _edge.bottom;
        }
        public function get left(): Number{
            return _edge.left;
        }
        public function get right(): Number{
            return _edge.right;
        }
        public function get topLeft(): Point{
            return _edge.topLeft;
        }
        public function get bottomRight(): Point{
            return _edge.bottomRight;
        }
        public function get Width() : Number{
            return _edge.width;
        }
         public function get Height() : Number{
            return _edge.height;
        }
        public function get size():Point{
            return _edge.size;
        }
        protected var _center : Point;
        public function get center():Point{
            this._center.x = edge.left + edge.width/2;
            this._center.y = edge.top + edge.height/2;
            return _center;
        }
        public function get centerX():Number{
            return center.x;
        }
        public function get centerY():Number{
            return center.y;
        }
        public function Component(){
            _edge = new Rectangle();
            _edge.left = 0;
            _edge.top = 0;
            _center = new Point(0, 0);
        }
        public function drawEdge():void{
            if(DEBUG){
                graphics.lineStyle(1, 0xFF0000, 1);
            }
            else{
                graphics.lineStyle(1, 0xFF0000, 0);
            }
            graphics.drawRect(_edge.left+0, _edge.top+0, _edge.width, _edge.height);
        }
        public function draw():void{
            this.graphics.clear();
            this.drawEdge();
        }
        public function get centerRotation():Number{
            return this.rotation;
        }
        public function set centerRotation(degree : Number): void{
            this.rotation = degree
            return;
        }
    }
}
