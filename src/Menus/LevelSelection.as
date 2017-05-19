package Menus 
{
	import starling.display.Image;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class LevelSelection extends Sprite
	{
		private var bg:Image;
		private var levelsTitle:Image;
		private var oneButton:Button;
		private var twoButton:Button;
		private var threeButton:Button;
		private var backButton:Button;
		
		public function LevelSelection() 
		{
			addEventListener(Event.ADDED_TO_STAGE, drawScreen);
		}
		
		private function drawScreen():void{
			removeEventListener(Event.ADDED_TO_STAGE,drawScreen);
			bg = new Image(Assets.getTexture("backgroundLevel"));
			levelsTitle = new Image(Assets.getTexture("levels_title"));
			oneButton = new Button(Assets.getTexture("level_1"));
			twoButton = new Button(Assets.getTexture("level_2"));
			threeButton = new Button(Assets.getTexture("level_3"));
			backButton = new Button(Assets.getTexture("back"));//Imagen provisional.
			
			addChild(bg);
			addChild(levelsTitle);
			addChild(oneButton);
			addChild(twoButton);
			addChild(threeButton);
			addChild(backButton);
			
			backButton.name = "backButton";
			backButton.width = backButton.width / 2.2;
			backButton.height = backButton.height / 2.2;
			
			levelsTitle.pivotX = levelsTitle.width / 2;
			levelsTitle.x = (stage.stageWidth * .5 - levelsTitle.width * .5) * 2;
			levelsTitle.y = stage.stageHeight / 12;
			
			oneButton.pivotX = oneButton.width / 2;
			oneButton.x = (stage.stageWidth * .5 - oneButton.width * .5) * 0.7;
			oneButton.y = stage.stageHeight / 3;
			oneButton.name = "oneButton";
			
			twoButton.pivotX = twoButton.width / 2;
			twoButton.x = (stage.stageWidth * .5 - twoButton.width * .5);
			twoButton.y = stage.stageHeight / 3;
			twoButton.name = "twoButton";
			
			threeButton.pivotX = threeButton.width / 2;
			threeButton.x = (stage.stageWidth * .5 - threeButton.width * .5) * 1.3 ;
			threeButton.y = stage.stageHeight / 3;
			threeButton.name = "threeButton";
			
			addEventListener(Event.TRIGGERED, onButtonTriggered);
			
			
		}
		
		public function onButtonTriggered(e:Event):void{
			var button:Button = e.target as Button;
			if (button.name == "oneButton") {
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "playLevel1"}, true));
			}else if(button.name == "twoButton"){
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "playLevel2"}, true));
			}else if (button.name == "threeButton"){
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "playLevel3"}, true));
			}else if(button.name == "backButton"){
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "exitLevelSelection"}, true));
			}
		}
		
		public function disposeTemporarily():void{
			this.visible = false;
		}
		
		public function initialize():void{
			this.visible = true;
		}
		
	}

}