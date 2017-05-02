package 
{
	import starling.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class Game extends Sprite
	{
		private var mainMenu:MainMenu;
		public function Game() 
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("Soooooooooo");
			mainMenu = new MainMenu();
			addChild(mainMenu);
			mainMenu.initialize();
		}
	}

}