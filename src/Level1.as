package 
{
	import flash.display.Bitmap;
	import starling.display.DisplayObjectContainer;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	//import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author JesúsDavid
	 */

	public class Level1 extends Sprite
	{
	
		private var bg:Image;
		private var torreta:Player;
		private var ball:Ball;
		
		// boundries
		private var _minX:int;
		private var _minY:int;
		private var _maxX:int;
		private var _maxY:int;
		
		
		//Mouse position:
		private var mouseX:Number = 0;
		private var mouseY:Number = 0;
		
		
		
		
		
		//Esto es para poner los limites del mapa y que las pelotas no se salgan y reboten y tal:
		private function setBoundries():void{
			_minX = 0;
			_minY = 0;
			_maxX = stage.stageWidth;
			_maxY = stage.stageHeight;
		}
		
		private function spawnBalls():void{
			var newRandomVelX:Number = Math.random() * 10 - 10;
			var newRandomVelY:Number = Math.random() * 10 - 10;
			var newRandomPositionX:Number = Math.random() * (_maxX- _minX) + _minX;
			var newRandomPositionY:Number = Math.random() * (_maxY- _minY) + _minY;
 
			//Ball usage: new Ball(x, y, velocity X, velocity Y);
			ball = new Ball(newRandomPositionX, newRandomPositionY, newRandomVelX,newRandomVelY);
			
		}
		
		public function Level1() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
			
		}
		
		private function onAddedtoStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
			setBoundries();
			
			spawnBalls();
			torreta = new Player();
			torreta.x = (stage.stageWidth - torreta.width)  * 0.45;
			torreta.y = (stage.stageHeight - torreta.height)  * 0.4;
			bg =  new Image(Assets.getTexture("background"));
			
			
			addChild(bg);
			stage.addChild(ball);
			addChild(torreta);
			
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(TouchEvent.TOUCH, onMouseMove);
			
			
		}
		
		private function onMouseMove(e:TouchEvent):void{
			var touch:Touch = e.getTouch(this);
			try{//Para que no se rompa el juego cuando el touch.phase sea null(el raton se salga de la pantalla).
				if(touch.phase == TouchPhase.HOVER)
				{
					mouseX = touch.globalX;
					mouseY = touch.globalY;
					torreta.pivotX = torreta.width  *0.5;
					torreta.pivotY = torreta.height  *0.5;
					torreta.rotation = (Math.atan2(mouseY, mouseX) * 180 / Math.PI);
					
				}
			}catch(e){
				
			}

		}
		
		
		private function onEnterFrame(e:Event):void 
		{
			ballMovement();
			trace(mouseX);
			trace(mouseY);
			
		}
		
		public function getDegrees(radians:Number):Number
		{
			return Math.floor(radians/(Math.PI/180));
		}
		
		private function ballMovement():void{

			//Comprobaciones para que no se salga de la panatalla:
			if (((ball.x - ball.width / 2) < _minX) && (ball.velocityX < 0))
			{
			  ball.velocityX = -ball.velocityX;
			}

			if ((ball.x + ball.width / 2) > _maxX && (ball.velocityX > 0))
			{
			  ball.velocityX = -ball.velocityX;
			}
 

			if (((ball.y - ball.height / 2) < _minY) && (ball.velocityY < 0))
			{
			  ball.velocityY = -ball.velocityY
			}

			if (((ball.y + ball.height / 2) > _maxY) && (ball.velocityY > 0))
			{
			  ball.velocityY = -ball.velocityY;
			}
 
			// actualizar la posición de la pelota:
			ball.x += ball.velocityX;
			ball.y += ball.velocityY;
		}
	}
		
}
