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
	public class Ball extends Sprite
	{
		private var _velocityX:Number = 0;
		private var _velocityY:Number = 0;
		private var ball:Image;
		private var score:int = 5;
		private var freeze = false;
		
		public function Ball(x:Number, y:Number, velocityX:Number, velocityY:Number) 
		{
			this.x = x
			this.y = y
			_velocityX = velocityX
			_velocityY = velocityY;
			
			ball = new Image(Assets.getTexture("bola_normal"));
			ball.height = ball.height / 2;
			ball.width = ball.width / 2;
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
		
		public function removeBall(){
			removeChild(ball);
		}
		
		public function getScore(): int{
			return score;
		}
		
		public function isFreeze(): Boolean{
			return freeze;
		}
		
		public function setFreeze(freeze:Boolean):void{
			this.freeze = freeze;
		}
		
		
	}
	
}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 /*
	 
	 
	 public class Ball extends Sprite
	{
		
		private var ballMovieClip:MovieClip;
		private var ball:Image;
		private var mouseX:Number;
		private var mouseY:Number;
		private var posx:int = 0;
		private var posy:int = 0;
		
		
		public function Ball(posx:int, posy:int)
		{
			this.posx = posx;
			this.posy = posy;
			this.addEventListener(Event.ADDED_TO_STAGE, onStage);

		}
		private function onStage(e:Event):void
		{

			
			
			this.addEventListener(Event.ENTER_FRAME,on_enter_frame);
			removeEventListener(Event.ADDED_TO_STAGE, onStage);
			
		}		
		
		private function on_enter_frame(e:Event):void
		{
			
		}

		
	}

}*/