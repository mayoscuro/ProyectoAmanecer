package GameObjects 
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
		
		
		public function Player()
		{

			this.addEventListener(Event.ADDED_TO_STAGE, onStage);

		}
		private function onStage(e:Event):void
		{

			base_canon = new Image(Assets.getTexture("base_canon"));
			base_canon.pivotX = base_canon.width / 2;
			base_canon.pivotY = base_canon.height / 2;
			addChild(base_canon);
			canon = new Image(Assets.getTexture("canon"));
			canon.pivotX = canon.width / 2;
			canon.pivotY = canon.height / 2;
			canon.rotation = 3.14;//Para que empeice de cara.
			addChild(canon);
			
		}

		/*public function get velocityX():Number { return _velocityX; }
		
		public function set velocityX(value:Number):void 
		{
			_velocityX = value;
		}
	*/

		
	}

}