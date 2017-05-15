package 
{
	import Level1.Level1;
	import Level2.Level2;
	import Level3.Level3;
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
		private var levelSelection:LevelSelection;
		private var screenInGame:Level1;
		private var screenInGame2:Level2;
		private var screenInGame3:Level3;
		private var settingsScreen:Settings;
		private var creditsScreen:Credits;
		
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
			
			levelSelection = new LevelSelection();
			levelSelection.disposeTemporarily();
			this.addChild(levelSelection);
			
			screenInGame = new Level1();
			screenInGame.disposeTemporarily();
			this.addChild(screenInGame);
			
			screenInGame2 = new Level2();
			screenInGame2.disposeTemporarily();
			this.addChild(screenInGame2);
			
			screenInGame3 = new Level3();
			screenInGame3.disposeTemporarily();
			this.addChild(screenInGame3);
			
			settingsScreen = new Settings();
			settingsScreen.disposeTemporarily();
			addChild(settingsScreen);
			
			creditsScreen = new Credits();
			creditsScreen.disposeTemporarily();
			addChild(creditsScreen);
			
			mainMenu = new MainMenu();
			addChild(mainMenu);
			mainMenu.initialize();
			
		}
		
		private function onChangeScreen(event:NavigationEvent):void{
			
			switch(event.params.id){
				case "play":
					mainMenu.ocultar();
					levelSelection.initialize();
					break;
				case "playLevel1":
					mainMenu.ocultar();
					screenInGame.initialize();
					break;
				case "playLevel2":
					mainMenu.ocultar();
					screenInGame2.initialize();
					break;
				case "playLevel3":
					mainMenu.ocultar();
					screenInGame3.initialize();
					break;
				case "credits":
					//Poner una clase con el titulo creditos y poner en texto los nombres (tampoco matarse mucho).
					mainMenu.ocultar();
					creditsScreen.initialize();
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
				case "exitCredits":
					mainMenu.initialize();
					creditsScreen.disposeTemporarily();
					break;
			}
			
		}
	}

}