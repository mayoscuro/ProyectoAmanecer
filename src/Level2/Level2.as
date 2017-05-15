package Level2 
{
	import flash.display.Bitmap;
	import starling.display.DisplayObjectContainer;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	
	/**
	 * ...
	 * @author JesúsDavid
	 */

	public class Level2 extends Sprite
	{
	
		private var bg:Image;
		private var torreta:Player;
		private var ball:Ball;
		
		// boundries
		private var _minX:int;
		private var _minY:int;
		private var _maxX:int;
		private var _maxY:int;
		
		//Enemy's vector:
		private var enemigos:Vector.<Ball> = new Vector.<Ball>();
		
		
		//Mouse position:
		private var mouseX:Number = 0;
		private var mouseY:Number = 0;
		
		//Puntos:
		private var score:int = 1000;
		var frames:int = 0;//Cuenta los frames.
		var segundos:int = 0;//Cada 20 frames, un segundo.
		
		//Acabar nivel:
		private var fin:Boolean = false;
		
		//NivelOculto:
		private var oculto:Boolean = false;
		
		public function disposeTemporarily():void{
			this.visible = false;
			oculto = true;
			if (this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			//removeEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
		}
		
		private function hideSpawnBalls():void{
			for each (var pelota in enemigos){
				pelota.visible = false;
			}
		}
		
		private function showSpawnBalls():void{
			for each (var pelota in enemigos){
				pelota.visible = true;
			}
		}
		
		public function initialize():void{
			this.visible = true;
			oculto = false;
			showSpawnBalls();
			//addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
			//addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		//Esto es para poner los limites del mapa y que las pelotas no se salgan y reboten y tal:
		private function setBoundries():void{
			_minX = 0;
			_minY = 0;
			_maxX = stage.stageWidth;
			_maxY = stage.stageHeight;
		}
		
		private function spawnBalls():void{
			var x:int = 0;
			var newRandomVelX:Number;
			var newRandomVelY:Number;
			var newRandomPositionX:Number;
			var newRandomPositionY:Number;
			while (x<10){
				newRandomVelX = Math.random() * 3 - 3;
				newRandomVelY = Math.random() * 3 - 3;
				newRandomPositionX = Math.random() * (_maxX- _minX) + _minX;
				newRandomPositionY = Math.random() * (_maxY- _minY) + _minY;
 
				//Ball usage: new Ball(x, y, velocity X, velocity Y);
				ball = new Ball(newRandomPositionX, newRandomPositionY, newRandomVelX, newRandomVelY);
				enemigos.push(ball);
				stage.addChild(ball);
				x = x + 1;
			}
		}
		
		public function Level2() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
			
		}
		
		private function onAddedtoStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
			setBoundries();
			spawnBalls();
			hideSpawnBalls();
			torreta = new Player();
			torreta.x = (stage.stageWidth - torreta.width)  * 0.45;
			torreta.y = (stage.stageHeight - torreta.height)  * 0.5;
			torreta.pivotX = torreta.width / 2;
			torreta.pivotY = torreta.height / 2;
			bg =  new Image(Assets.getTexture("background"));
			
			
			addChild(bg);
			addChild(torreta);
			
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(TouchEvent.TOUCH, onMouseMove);
			torreta.addEventListener(Event.ENTER_FRAME, enterFrameTorreta);
			
			
		}
		
		
		function bulletEnterFrame(e:Event) {
			var b = e.currentTarget;
			b.x +=  Math.cos(b.getAngleRadian) * b.velocityX;
			b.y +=  Math.sin(b.getAngleRadian) * b.velocityY;
			b.rotation = b.getAngleRadian * 180 / Math.PI;
			if (b.x < 0 || b.x > 1000 || b.y < 0 || b.y > 700) {//Si se sale del mapa elimina la bola(del jugador).
				removeChild(b);
				b.removeEventListener(Event.ENTER_FRAME, bulletEnterFrame);
			} 
			
			for each (var pelota in enemigos){
				if(b.x > pelota.x - pelota.width / 2 && 
					b.x < pelota.x + pelota.width / 2 &&
					b.y > pelota.y - pelota.height / 2 && 
					b.y < pelota.y + pelota.height / 2){//Si colisiona con una pelota enemiga, que la destruya.
						score += pelota.getScore();
						//trace(score);
						enemigos.removeAt(enemigos.indexOf(pelota));
						pelota.removeBall();
						removeChild(pelota);
				}
			}
		}
		
		private function onMouseMove(e:TouchEvent):void{
			var touch:Touch = e.getTouch(this);
			try{//Para que no se rompa el juego cuando el touch.phase sea null(el raton se salga de la pantalla).
				if(touch.phase == TouchPhase.HOVER && !fin)// si se mueve el raton
				{
					mouseX = touch.globalX;
					mouseY = touch.globalY;
					torreta.pivotX = torreta.width * 0.5 ;
					torreta.pivotY = torreta.height * 0.5 ;
					
					
				}else if(touch.phase == TouchPhase.BEGAN && !fin){//Si se pulsa en la pantalla(o click del raton)
					var b = new PlayerBall(torreta.x,torreta.y);
					b.setAngleRadian = Math.atan2(mouseY - torreta.y,mouseX -torreta.x);
					b.addEventListener(Event.ENTER_FRAME, bulletEnterFrame);//Para que la bola pueda ir actualizando su movimiento.
					addChild(b);
				}
			}catch(e){
				
			}

		}
		
		private function enterFrameTorreta(e:Event):void{
			var angleRadian=Math.atan2(mouseY-torreta.y,mouseX-torreta.x);
			var angleDegree = angleRadian * 180 / Math.PI;
			torreta.rotation = angleDegree;
			//trace( Math.round(angleDegree) + "°");
		}
		
		
		private function onEnterFrame(e:Event):void 
		{
			frames ++;
			//20 FRAMES UN SEGUNDO;
			if (frames == 20 && oculto == false){
				segundos = 1;
				frames = 0;
			}else{
				segundos = 0;
			}
			if (!fin && oculto == false ){
				score-= segundos;
				trace(score);
			}
			for each(var pelota in enemigos){
				ballMovement(pelota);
				ballCollision(pelota);
			}
			
			if(enemigos.length == 0 && !fin){//Cuando ya no quedan enemigos, el jugador ha ganado.
				trace("Ya has ganado xD");
				fin = true;
			}
			
		}
		
		public function ballCollision(pelota:Ball){
			
			for each (var otherBall in enemigos){
				if(otherBall.x > pelota.x - pelota.width / 2 && otherBall.x < pelota.x + pelota.width / 2 &&
					otherBall.y > pelota.y - pelota.height / 2 && otherBall.y < pelota.y + pelota.height / 2){//Si colisiona con una pelota enemiga, que rebote.
						
						otherBall.velocityX =  -otherBall.velocityX;
						otherBall.velocityY= -otherBall.velocityY;
						pelota.velocityX= -pelota.velocityX;
						pelota.velocityY = - pelota.velocityY;
					
					}
			}
		}
		
		public function getDegrees(radians:Number):Number
		{
			return Math.floor(radians/(Math.PI/180));
		}
		
		private function ballMovement(pelota:Ball):void{

			//Comprobaciones para que no se salga de la panatalla:
			if (((pelota.x - pelota.width / 2) < _minX) && (pelota.velocityX < 0)){
				pelota.velocityX = -pelota.velocityX;
			}else if ((pelota.x + pelota.width / 2) > _maxX && (pelota.velocityX > 0)){
				pelota.velocityX = -pelota.velocityX;
			}else if (((pelota.y - pelota.height / 2) < _minY) && (pelota.velocityY < 0)){
				pelota.velocityY = -pelota.velocityY
			}else if (((pelota.y + pelota.height / 2) > _maxY) && (pelota.velocityY > 0)){
				pelota.velocityY = -pelota.velocityY;
			}
 
			// actualizar la posición de la pelota:
			pelota.x += pelota.velocityX;
			pelota.y += pelota.velocityY;
		}
		
	}
		
}
