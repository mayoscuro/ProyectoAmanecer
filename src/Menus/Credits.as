package Menus 
{
	import Navigation.NavigationEvent;
	import starling.display.Image;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.text.TextFormat;
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class Credits extends Sprite
	{
		
		private var bg:Image;
		private var settingsTitle:Image;
		private var texto:TextField;
		private var backButton:Button;
		private var textFormat:TextFormat = new TextFormat("Georgia", 24, 0x0);
		
		public function Credits() 
		{
			addEventListener(Event.ADDED_TO_STAGE, drawScreen);
		}
		
		private function drawScreen():void{
			removeEventListener(Event.ADDED_TO_STAGE,drawScreen);
			bg = new Image(Assets.getTexture("backgroudMenu"));
			settingsTitle = new Image(Assets.getTexture("credits_title"));
			texto = new TextField(530, 200, "", textFormat);
			backButton = new Button(Assets.getTexture("back"));
			
			addChild(bg);
			addChild(settingsTitle);
			addChild(backButton);
			addChild(texto);

			texto.text = "This game was developed by: Jesús Mayoral Itarte and David Caceres Frias";
			//texto.fontSize = 30;
			//texto.bold = true;
			
			backButton.name = "backButton";
			backButton.width = backButton.width / 2.2;
			backButton.height = backButton.height / 2.2;
			
			settingsTitle.pivotX = settingsTitle.width / 2;
			settingsTitle.x = (stage.stageWidth * .5 - settingsTitle.width * .5) * 2;
			settingsTitle.y = stage.stageHeight / 12;
			
			//texto.pivotX = texto.width / 2;
			texto.x = (stage.stageWidth * .5 - texto.width * .5);
			texto.y = stage.stageHeight / 3;
			
			addEventListener(Event.TRIGGERED, onButtonTriggered);
			
			
		}
		
		public function onButtonTriggered(e:Event):void{
			var button:Button = e.target as Button;
			if(button.name == "backButton"){
				this.dispatchEvent(new Navigation.NavigationEvent(Navigation.NavigationEvent.CHANGE_SCREEN, {id: "exitCredits"}, true));
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