package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	public class Main extends Sprite
	{
		private var nclick:uint = 0;
		private var tf:TextField;
		public function Main()
		{
			tf = new TextField();
			tf.text = "Hello World";
			tf.x = stage.stageWidth/2-tf.textWidth/2;
			tf.y = stage.stageHeight/2-tf.textHeight/2;
			addChild(tf);
			this.stage.addEventListener(MouseEvent.CLICK, onMouseClickStage);
		}
		private function onMouseClickStage(e: MouseEvent):void{
			nclick++;
			tf.text = ""+nclick;
		}
	}
}
