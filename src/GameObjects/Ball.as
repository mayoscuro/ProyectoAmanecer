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
	public class Ball extends Sprite
	{
		private var _velocityX:Number = 0;
		private var _velocityY:Number = 0;
		private var ball:Image;
		private var score:int = 5;
		private var freeze = false;
		private var fase: int = 1;
		private var vidaFase3:int = 3;
		private var vidaFase2:int = 2;
		private var vidaFase1:int = 1;
		private var fast = false;
		
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
		
		public function setFastBall(){
			fast = true;
			score = score + 30;
		}
		
		public function isFastBall(){
			return fast;
		}
		
		public function getVida():int{
			
			trace(vidaFase2);
			if (fase == 2){
				return vidaFase2;
			}else if(fase == 3){
				return vidaFase3;
			}
			return vidaFase1;
		}
		
		public function restarVida():void{
			if(fase == 1){
				--vidaFase1;
			}else if (fase == 2){
				--vidaFase2;
			}else if(fase == 3){
				--vidaFase3;
			}
			
		}
		
		public function getFase():int{
			return fase;
		}
		
		public function setFase(fase:int){
			this.fase = fase;
			if(this.fase == 1){
				ball.height = ball.height;
				ball.width = ball.width;
			}else if(this.fase == 2){
				ball.height = ball.height*2;
				ball.width = ball.width * 2;
			}else if(this.fase == 3){
				ball.height = ball.height*4;
				ball.width = ball.width * 4;
			}
		}
		
		public function setFreeze(freeze:Boolean):void{
			this.freeze = freeze;
			if(freeze){
				ball.texture = Assets.getTexture("bola_congelada");
			}else{
				ball.texture = Assets.getTexture("bola_normal");
			}
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