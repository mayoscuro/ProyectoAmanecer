package 
{
	import starling.display.Sprite;
	import starling.display.Button;
	import starling.display.Image;
	import flash.events.MouseEvent;
	import starling.events.Event;
	import starling.core.Starling;
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class MainMenu extends Sprite
	{
		private var bg:Image;
		private var title:Image;
		private var play:Button;
		private var credits:Button;
		private var options:Button;
		private var exit:Button;
		
		
		
		
		private var mStarling:Starling;
		
		public function MainMenu() 
		{
			drawScreen();
		
		}
		
		private function drawScreen():void{
			bg = new Image(Assets.getTexture("backgroudMenu"));
			title = new Image(Assets.getTexture("title"));
			play = new Button(Assets.getTexture("play"));
			credits = new Button(Assets.getTexture("credits"));
			options = new Button(Assets.getTexture("options"));
			exit = new Button(Assets.getTexture("exit"));
			play.name = "play";
			credits.name = "credits";
			options.name = "options";
			exit.name = "exit";
			
			addChild(bg);
			addChild(title);
			addChild(play);
			addChild(credits);
			addChild(options);
			addChild(exit);
			
			title.width = title.width / 2;
			title.height = title.height / 2;
			title.pivotX = title.width / 2;
			
			
			play.width = play.width/2;
			credits.width = credits.width / 2;
			options.width = options.width / 2;
			exit.width = exit.width / 2;
			play.height = play.height/2;
			credits.height = credits.height / 2;
			options.height = options.height / 2;
			exit.height = exit.height / 2;
			
			
			
			title.x = 300;
			
			play.x = 320;
			credits.x = 320;
			options.x = 320;
			exit.x = 320;
			
			play.y = 250;
			credits.y = 320;
			options.y = 390;
			exit.y = 460;
			
			
			addEventListener(Event.TRIGGERED, onButtonTriggered);

		}
		

		

		public function onButtonTriggered(e:Event):void{
			var button:Button = e.target as Button;
			//////removeEventListener(Event.TRIGGERED, onButtonTriggered);
			if (button.name == "play") {		
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
			}else if(button.name == "credits"){
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "credits"}, true));
			}else if(button.name == "options"){
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "options"}, true));
			}else if(button.name == "exit"){
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "exit"}, true));
			}
		}
		
		
		public function ocultar():void{
			this.visible = false;
			
		}
		
		public function initialize():void{
			
			this.visible = true;
		}
	}

}