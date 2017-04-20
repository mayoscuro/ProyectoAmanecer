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
	public class PlayerBall extends Sprite
	{
		
		private var _velocityX:Number = 0;
		private var _velocityY:Number = 0;
		private var ball:Image;
		public var angleRadian:Number;
		
		public function PlayerBall(x:Number, y:Number) 
		{
			this.x = x
			this.y = y
			_velocityX = velocityX
			_velocityY = velocityY;
			
			ball = new Image(Assets.getTexture("base_canon"));
			ball.height = ball.height /3;
			ball.width = ball.width /3;
			addChild(ball);
			
		}
		
		//-----------------------------
		// Getters & Setters
		//-----------------------------
		
		public function get velocityX():Number { return _velocityX; }
		
		public function set velocityX(value:Number):void 
		{
			_velocityX = value;
		}
		
		public function get velocityY():Number { return _velocityY; }
		
		public function set velocityY(value:Number):void 
		{
			_velocityY = value;
		}
		
	}

}