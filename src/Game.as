package 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.system.fscommand;
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class Game extends Sprite
	{
		private var mainMenu:MainMenu;
		private var screenInGame:Level1;
		private var settingsScreen:Settings;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			//removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("Soooooooooo");
			
			this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			screenInGame = new Level1();
			screenInGame.disposeTemporarily();
			this.addChild(screenInGame);
			settingsScreen = new Settings();
			settingsScreen.disposeTemporarily();
			addChild(settingsScreen);
			mainMenu = new MainMenu();
			addChild(mainMenu);
			mainMenu.initialize();
		}
		
		private function onChangeScreen(event:NavigationEvent):void{
			
			switch(event.params.id){
				case "play":
					mainMenu.ocultar();
					screenInGame.initialize();
					break;
				case "credits":
					//Poner una clase con el titulo creditos y poner en texto los nombres (tampoco matarse mucho).
					break;
				case "options":
					//Poner una pantalla de opciones
					mainMenu.ocultar();
					settingsScreen.initialize();
					break;
				case "exit":
					fscommand("quit");
					break;
				case "exitSettings":
					mainMenu.initialize();
					settingsScreen.disposeTemporarily();
					break;
			}
			
		}
	}

}