package Menus 
{
	import Navigation.NavigationEvent;
	import Sound.GlobalSound;
	import starling.display.Image;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class Settings extends Sprite
	{
		private var bg:Image;
		private var settingsTitle:Image;
		private var soundButtonOn:Button;
		private var soundButtonOff:Button;
		private var backButton:Button;
		
		public function Settings() 
		{
			addEventListener(Event.ADDED_TO_STAGE, drawScreen);
		}
		
		private function drawScreen():void{
			removeEventListener(Event.ADDED_TO_STAGE,drawScreen);
			bg = new Image(Assets.getTexture("backgroudMenu"));
			settingsTitle = new Image(Assets.getTexture("OPTIONS_title"));
			soundButtonOn = new Button(Assets.getTexture("soundOn"));
			soundButtonOff = new Button(Assets.getTexture("soundOff"));
			backButton = new Button(Assets.getTexture("back"));//Imagen provisional.
			
			addChild(bg);
			addChild(settingsTitle);
			addChild(soundButtonOn);
			addChild(soundButtonOff);
			addChild(backButton);
			
			backButton.name = "backButton";
			backButton.width = backButton.width / 2.2;
			backButton.height = backButton.height / 2.2;
			
			soundButtonOff.visible = false;
			
			settingsTitle.pivotX = settingsTitle.width / 2;
			settingsTitle.x = (stage.stageWidth * .5 - settingsTitle.width * .5) * 2;
			settingsTitle.y = stage.stageHeight / 12;
			
			soundButtonOn.pivotX = soundButtonOn.width / 2;
			soundButtonOn.x = (stage.stageWidth * .5 - soundButtonOn.width * .5) * 2;
			soundButtonOn.y = stage.stageHeight / 3;
			soundButtonOn.name = "soundButtonOn";
			
			soundButtonOff.pivotX = soundButtonOff.width / 2;
			soundButtonOff.x = (stage.stageWidth * .5 - soundButtonOff.width * .5) * 2;
			soundButtonOff.y = stage.stageHeight / 3;
			soundButtonOff.name = "soundButtonOff";
			
			addEventListener(Event.TRIGGERED, onButtonTriggered);
			
			
		}
		
		public function onButtonTriggered(e:Event):void{
			var button:Button = e.target as Button;
			if (button.name == "soundButtonOn") {
				soundButtonOn.visible = false;
				soundButtonOff.visible = true;
				this.dispatchEvent(new Navigation.NavigationEvent(Navigation.NavigationEvent.CHANGE_SOUND, {id: "soundOff"}, true));
			}else if(button.name == "soundButtonOff"){
				soundButtonOn.visible = true;
				soundButtonOff.visible = false;
				this.dispatchEvent(new Navigation.NavigationEvent(Navigation.NavigationEvent.CHANGE_SOUND, {id: "soundOn"}, true)); 
			}else if(button.name == "backButton"){
				this.dispatchEvent(new Navigation.NavigationEvent(Navigation.NavigationEvent.CHANGE_SCREEN, {id: "exitSettings"}, true));
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