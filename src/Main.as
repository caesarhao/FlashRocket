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
	import libraries.Debug;
	import libraries.shapes.*;
	import libraries.shapes.RectangleExt;
	public class Main extends Sprite
	{
		private var coord : Coordinator;
		private var nclick:uint = 0;
		private var tf:TextField;
		private var eng:Engine;
		private var tank : Tank;
		private var rs : RocketStage;
		public function Main()
		{
			Debug.debugLevel = Debug.ALL;
			Debug.init();
			coord = new Coordinator(this);
			tf = new TextField();
			tf.width = 200;
			tf.text = "" + Coordinator.frameRate;
			tf.x = stage.stageWidth/2-tf.textWidth/2;
			tf.y = 0;
			addChild(tf);
			eng = new Engine();
			eng.x = 250;
			eng.y = 200;
			addChild(eng);
			tank = new Tank(PropellantType.RP1, 10, 3, 0.3);
			tank.x = 200;
			tank.y = 200;
			addChild(tank);
			rs = RocketStage.create_CZ_5_500();
			rs.draw();
			rs.x = 250;
			rs.y = 200;
			addChild(rs);
			Debug.info("rocket stage is added");
			//this.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownStage);
			//this.stage.addEventListener(MouseEvent.CLICK, onMouseClickStage);
			//this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.graphics.lineStyle(1, 0xEE0000, 1);
			this.graphics.moveTo(250, 0);
			this.graphics.lineTo(250, 400);
			this.graphics.moveTo(0, 200);
			this.graphics.lineTo(500, 200);
			//new Arc(50, -Math.PI/2, -Math.PI/3).drawOnTarget(this.graphics, 100, 50);
			//new RectangleExt(200, 100).drawOnTarget(this.graphics, 100, 50);
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
