package 
{
	import flash.display.Sprite;
	import starling.display.Button;
	import starling.display.Image;
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
		
		public function MainMenu() 
		{
			drawScreen();
		
		}
		
		private function drawScreen():void{
			/*bg = new Image(Assets.getTexture("backgroudMenu"));
			title = new Image(Assets.getTexture("title"));
			play = new Button(Assets.getTexture("play"));
			credits = new Button(Assets.getTexture("credits"));
			options = new Button(Assets.getTexture("options"));
			exit = new Button(Assets.getTexture("exit"));
			
			addChild(bg);
			addChild(title);
			addChild(play);
			addChild(credits);
			addChild(options);
			addChild(exit);*/

			
		}
		
		public function initialize():void{
			
			this.visible = true;
		}
	}

}