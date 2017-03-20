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
		private var imageAtlas:Bitmap;
		private var imageAtlasTexture:Texture;
		private var xmlImageAtlas:XML;
		private var bg:Image;

		
	
		private var _background:Image;
		
		public function Level1() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
		}
		
		private function onAddedtoStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
			bg =  new Image(Assets.getTexture("background"));
			addChild(bg);
			bg.x = stage.width / 0.27;
			bg.y = stage.height / 0.4;
		
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		private function onEnterFrame(e:Event):void 
		{
			
		}
	}
		
}
