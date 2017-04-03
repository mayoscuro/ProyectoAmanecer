package 
{
	import flash.display.Bitmap;
	import starling.display.DisplayObjectContainer;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import flash.events.MouseEvent;
	//import flash.display.DisplayObjectContainer;
	
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
		
		
		//player settings:
		private var _trueRotation:Number = 0;
		private var _dx:Number = 0;
		private var _dy:Number = 0;
		private var _destinationX:int = 150;
		private var _destinationY:int = 150;
		private var _rotateSpeedMax:Number = 15;
		
		
		
		
		
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
			
			
			addEventListener(MouseEvent.MOUSE_MOVE, mMove);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		
		private function onEnterFrame(e:Event):void 
		{
			ballMovement();
			torretaMovement();
		}
		
		

		private function mMove(e:MouseEvent):void {
			_dx = e.stageX;
			_dy = e.stageY;
			
		}  
		
		private function torretaMovement():void{ 
			trace(_dx+", "+ _dy);
			// which way to rotate
			var rotateTo:Number = getDegrees(getRadians(_dx, _dy));
 
			// keep rotation positive, between 0 and 360 degrees
			if (rotateTo > torreta.rotation + 180) rotateTo -= 360;
			if (rotateTo < torreta.rotation - 180) rotateTo += 360;
 
			// ease rotation
			_trueRotation = (rotateTo - torreta.rotation) / _rotateSpeedMax;
 
			// update rotation
			torreta.rotation += _trueRotation;
		}
		
		public function getDegrees(radians:Number):Number
		{
			return Math.floor(radians/(Math.PI/180));
		}
		
		public function getRadians(delta_x:Number, delta_y:Number):Number
		{
			var r:Number = Math.atan2(delta_y, delta_x);
 
			if (delta_y < 0)
			{
				r += (2 * Math.PI);
			}
			return r;
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
