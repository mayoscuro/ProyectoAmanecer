package 
{
	import Level1.Level1;
	import Level2.Level2;
	import Level3.Level3;
	import Menus.Credits;
	import Menus.LevelSelection;
	import Menus.MainMenu;
	import Menus.Settings;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.system.fscommand;
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class Game extends Sprite
	{
		private var mainMenu:Menus.MainMenu;
		private var levelSelection:Menus.LevelSelection;
		private var screenInGame:Level1;
		private var screenInGame2:Level2;
		private var screenInGame3:Level3;
		private var settingsScreen:Menus.Settings;
		private var creditsScreen:Menus.Credits;
		private var sonidoActivo:Boolean = true;
		private var level:int = 0;
		
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
			this.addEventListener(NavigationEvent.CHANGE_SOUND, onChangeSound);
			
			levelSelection = new Menus.LevelSelection();
			levelSelection.disposeTemporarily();
			this.addChild(levelSelection);
			
			screenInGame3 = new Level3();
			screenInGame3.disposeTemporarily();
			this.addChild(screenInGame3);
			
			settingsScreen = new Menus.Settings();
			settingsScreen.disposeTemporarily();
			addChild(settingsScreen);
			
			creditsScreen = new Menus.Credits();
			creditsScreen.disposeTemporarily();
			addChild(creditsScreen);
			
			mainMenu = new Menus.MainMenu();
			addChild(mainMenu);
			mainMenu.initialize();
			
		}
		
		private function onChangeSound(event:NavigationEvent):void{
			switch(event.params.id){
				case "soundOff":
					sonidoActivo = false;
					break;
				case "soundOn":
					sonidoActivo = true;
					break;
			}
		}
		
		private function onChangeScreen(event:NavigationEvent):void{
			
			switch(event.params.id){
				
				case "play":
					mainMenu.ocultar();
					levelSelection.initialize();
					break;
				case "exitLevelSelection":
					mainMenu.initialize();
					levelSelection.disposeTemporarily();
					break;
				case "playLevel1":
					screenInGame = new Level1();
					screenInGame.disposeTemporarily();
					this.addChild(screenInGame);
					
					mainMenu.ocultar();
					level = 1;
					trace(sonidoActivo);
					if(sonidoActivo){
						screenInGame.initialize();
					}else{
						screenInGame.initializeWithoutSound();
					}
					break;
				case "playLevel2":
					screenInGame2 = new Level2();
					screenInGame2.disposeTemporarily();
					this.addChild(screenInGame2);
					level = 2;
					mainMenu.ocultar();
					screenInGame2.initialize();
					break;
				case "playLevel3":
					mainMenu.ocultar();
					level = 3;
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
				case "levelComplete":
					if (level == 1){
						removeChild(screenInGame);
						
						screenInGame2 = new Level2();
						screenInGame2.disposeTemporarily();
						this.addChild(screenInGame2);
						screenInGame2.initialize();
						level = 2;
					}else if(level == 2){//Esto es de prueba por ahora.
						removeChild(screenInGame2);
						mainMenu.initialize();
						level = 0;
					}
					break;
			}
			
		}
	}

}