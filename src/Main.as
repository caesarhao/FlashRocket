package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import component.engine.Engine;
	import component.Tank;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import propellant.PropellantType;
	import coordinator.Coordinator;
	import component.RocketStage;
	public class Main extends Sprite
	{
		private var coord : Coordinator;
		private var nclick:uint = 0;
		private var tf:TextField;
		private var eng:Engine;
		private var tank : Tank;
		private var rkstg : RocketStage;
		public function Main()
		{
			coord = new Coordinator(this);
			tf = new TextField();
			tf.width = 200;
			tf.text = "" + Coordinator.frameRate;
			tf.x = stage.stageWidth/2-tf.textWidth/2;
			tf.y = 0;
			addChild(tf);
			eng = new Engine();
			eng.x = stage.stageWidth/2 - eng.centerX;
			eng.y = stage.stageHeight/2 - eng.centerY;
			addChild(eng);
			tank = new Tank(PropellantType.RP1, 10, 3, 0.3);
			tank.x = 200;
			tank.y = 200;
			addChild(tank);
			rkstg = RocketStage.create_CZ_5_500();
			rkstg.draw();
			rkstg.x = 300;
			rkstg.y = 300;
			addChild(rkstg);
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownStage);
			this.stage.addEventListener(MouseEvent.CLICK, onMouseClickStage);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.graphics.lineStyle(1, 0xEE0000, 1);
			this.graphics.moveTo(250, 0);
			this.graphics.lineTo(250, 400);
			this.graphics.moveTo(0, 200);
			this.graphics.lineTo(500, 200);
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
				eng.pivotRotation -= 10;
				tank.centerRotation -= 10;
			}
			else if(e.keyCode == Keyboard.RIGHT){
				eng.pivotRotation += 10;
				tank.centerRotation += 10;
			}
			else if(e.keyCode == Keyboard.UP){
				eng.y --;
				tank.fillingRatio += 0.1;
			}
			else if(e.keyCode == Keyboard.DOWN){
				eng.y ++;
				tank.fillingRatio -= 0.1;
			}
			else{

			}
			tf.text = "Engine Coord: x "+eng.x + " y " + eng.y;
		}
	}
}
