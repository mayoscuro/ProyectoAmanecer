package 
{
import flash.geom.Point;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.events.Event;
import starling.core.Starling;
import starling.display.Image;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import flash.events.MouseEvent;

	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class Player extends Sprite
	{
		
		private var player:MovieClip;
		private var canon:Image;
		private var base_canon:Image;
		private var mouseX:Number;
		private var mouseY:Number;
		
		
		public function Player()
		{

			this.addEventListener(Event.ADDED_TO_STAGE, onStage);

		}
		private function onStage(e:Event):void
		{

			base_canon = new Image(Assets.getTexture("base_canon"));
			addChild(base_canon)
			canon = new Image(Assets.getTexture("canon"));
			addChild(canon);
			
			this.addEventListener(Event.ENTER_FRAME,on_enter_frame);
			removeEventListener(Event.ADDED_TO_STAGE, onStage);
			
		}

		private function onTouch(e:TouchEvent):void
		{

		}
		
		
		private function on_enter_frame(e:Event):void
		{

		}

		
	}

}