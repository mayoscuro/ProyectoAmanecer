package 
{
		import flash.display.Bitmap;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author JesúsDavid
	 */

	public class Level1 extends Sprite
	{
	
		private var bg:Image;
		private var Torreta:Player;
		

		
	
		private var _background:Image;
		
		public function Level1() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
		}
		
		private function onAddedtoStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
			
			Torreta = new Player();
			//Torreta.alignPivot("center", "center");
			Torreta.x = (stage.stageWidth - Torreta.width)  * 0.45;
			Torreta.y = (stage.stageHeight - Torreta.height)  * 0.4;
			bg =  new Image(Assets.getTexture("background"));
			
			
			
			addChild(bg);
			addChild(Torreta);
			
			
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		private function onEnterFrame(e:Event):void 
		{
			
		}
	}
		
}
