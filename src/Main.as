package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import component.engine.Engine;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	public class Main extends Sprite
	{
		private var nclick:uint = 0;
		private var tf:TextField;
		private var eng:Engine;
		public function Main()
		{
			tf = new TextField();
			tf.width = 200;
			tf.text = "Hello World";
			tf.x = stage.stageWidth/2-tf.textWidth/2;
			tf.y = 0;
			addChild(tf);
			eng = new Engine();
			eng.x = stage.stageWidth/2 - eng.pivotX;
			eng.y = stage.stageHeight/2 - eng.pivotY;
			addChild(eng);
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownStage);
			this.stage.addEventListener(MouseEvent.CLICK, onMouseClickStage);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(e : Event):void{
			nclick++;
		}
		private function onMouseClickStage(e: MouseEvent):void{
			nclick++;
			tf.text = ""+nclick;
		}
		private function onKeyDownStage(e:KeyboardEvent):void{
			if(e.keyCode == Keyboard.LEFT){
				eng.x --;
			}
			else if(e.keyCode == Keyboard.RIGHT){
				eng.x ++;
			}
			else if(e.keyCode == Keyboard.UP){
				eng.y --;
			}
			else if(e.keyCode == Keyboard.DOWN){
				eng.y ++;
			}
			else{

			}
			tf.text = "Engine Coord: x "+eng.x + " y " + eng.y;
		}
	}
}
