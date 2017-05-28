package Level1 
{
	
	import GameObjects.Ball;
	import GameObjects.Player;
	import GameObjects.PlayerBall;
	import Navigation.NavigationEvent;
	import Sound.GlobalSound;
	import Menus.Settings;
	import flash.display.Bitmap;
	import starling.text.TextField;
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
	import starling.display.Button;
	import flash.geom.Point;
	

	
	/**
	 * ...
	 * @author JesúsDavid
	 */

	public class Level1 extends Sprite
	{
		
		//Textos:
		private var scoreText:TextField;
		private var feedBackText:TextField;
		private var levelfinalScoreText:TextField;
		private var totalFinalScoreText:TextField;
		private var buttonNewLevel:Button;
		private var levelCompleteText:TextField;
		
	
		private var bg:Image;
		private var torreta:GameObjects.Player;
		private var ball:GameObjects.Ball;
		
		// boundries
		private var _minX:int;
		private var _minY:int;
		private var _maxX:int;
		private var _maxY:int;
		
		//Enemy's vector:
		private var enemigos:Vector.<GameObjects.Ball> = new Vector.<GameObjects.Ball>();
		
		
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
		
		//Sonido:
		private var silencio:Boolean = false;
		private var sonido:GlobalSound;
		
		public function disposeTemporarily():void{
			//sonido.playStopTemita(false);
			silencio = true;
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
			sonido.playStopTemita(true);
			silencio = false;
			this.visible = true;
			oculto = false;
			showSpawnBalls();
		}
		public function initializeWithoutSound():void{
			sonido.playStopTemita(false);
			silencio = true;
			this.visible = true;
			oculto = false;
			showSpawnBalls();
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
				ball = new GameObjects.Ball(newRandomPositionX, newRandomPositionY, newRandomVelX, newRandomVelY);
				enemigos.push(ball);
				stage.addChild(ball);
				x = x + 1;
			}
		}
		
		public function Level1() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
			
		}
		
		private function onAddedtoStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
			sonido = new GlobalSound();
			setBoundries();
			spawnBalls();
			hideSpawnBalls();
			
			torreta = new GameObjects.Player();
			torreta.pivotX = torreta.width/2;
			torreta.pivotY = torreta.height/2;
			torreta.x = (stage.stageWidth * .5 - torreta.width * .5);
			torreta.y = (stage.stageHeight * .5 - torreta.height * .5);
			
			bg =  new Image(Assets.getTexture("background"));
			
			
			
			InitializeText();
			
			
			addChild(bg);
			addChild(torreta);
			addChild(scoreText);
			addChild(feedBackText);
			addChild(levelfinalScoreText);
			addChild(totalFinalScoreText);
			addChild(buttonNewLevel);
			addChild(levelCompleteText);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(TouchEvent.TOUCH, onMouseMove);
			torreta.addEventListener(Event.ENTER_FRAME, enterFrameTorreta);
			
			
		}
		
		private function InitializeText(){
			
			scoreText = new TextField(90,20,"Score: ");
			scoreText.x = (stage.stageWidth - scoreText.width) * 0.001;
			scoreText.y = (stage.y + scoreText.height);
			
			feedBackText = new TextField(250, 100, "");
			feedBackText.x = (stage.stageWidth * .5 - feedBackText.width * .5);
			feedBackText.y = (stage.stageHeight - scoreText.height - torreta.y + (torreta.height / 2)) / 2;
			
			levelfinalScoreText =  new TextField(100,60,"");
			levelfinalScoreText.x = (stage.stageWidth * .5 - levelfinalScoreText.width * .5) - levelfinalScoreText.width * 2;
			levelfinalScoreText.y = (stage.stageHeight - levelfinalScoreText.height - torreta.y + (torreta.height / 2)) * 0.8;
			
			totalFinalScoreText =  new TextField(100,60,"");
			totalFinalScoreText.x = (stage.stageWidth * .5 - totalFinalScoreText.width * .5) + totalFinalScoreText.width * 2;
			totalFinalScoreText.y = (stage.stageHeight - totalFinalScoreText.height - torreta.y + (torreta.height / 2)) * 0.8;
			
			buttonNewLevel = new Button(Assets.getTexture("next_level"));
			buttonNewLevel.y = torreta.y * 1.2;
			buttonNewLevel.pivotX = buttonNewLevel.width / 2;
			buttonNewLevel.x = (stage.stageWidth * .5 - torreta.width * .5); 
			buttonNewLevel.visible = false;
			buttonNewLevel.name = "NextLevel";
			addEventListener(Event.TRIGGERED, onButtonTriggered);
			
			levelCompleteText = new TextField(250, 100, "LEVEL COMPLETE!");
			levelCompleteText.x = (stage.stageWidth * .5 - levelCompleteText.width * .5);
			levelCompleteText.y = (stage.y + levelCompleteText.height);
			levelCompleteText.visible = false;
			
		}
		
		
		
		function bulletEnterFrame(e:Event) {
			var bullet = e.currentTarget;
			bullet.x +=  Math.cos(bullet.getAngleRadian) * bullet.velocityX;
			bullet.y +=  Math.sin(bullet.getAngleRadian) * bullet.velocityY;
			bullet.rotation = bullet.getAngleRadian * 180 / Math.PI;
			if (bullet.x < 0 || bullet.x > 1000 || bullet.y < 0 || bullet.y > 700) {//Si se sale del mapa elimina la bola(del jugador).
				removeChild(bullet);
				bullet.removeEventListener(Event.ENTER_FRAME, bulletEnterFrame);
			} 
			
			for each (var pelota in enemigos){
				if(bullet.getBounds(bullet.parent).intersects(pelota.getBounds(pelota.parent))){	
						if(!silencio){//Cuando el sonido este activo
							sonido.playStopExplosion(true);
						}
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
					//torreta.pivotX = torreta.width * 0.5 ;
					//torreta.pivotY = torreta.height * 0.5 ;
					
					
				}else if(touch.phase == TouchPhase.BEGAN && !fin){//Si se pulsa en la pantalla(o click del raton)
					if(!silencio){
						sonido.playStopPiumPium(true);
					}
					var b = new GameObjects.PlayerBall(torreta.x,torreta.y);
					b.setAngleRadian = Math.atan2(mouseY - torreta.y,mouseX -torreta.x);
					b.addEventListener(Event.ENTER_FRAME, bulletEnterFrame);//Para que la bola pueda ir actualizando su movimiento.
					addChild(b);
				}
			}catch(e){
				
			}

		}
		
		private function enterFrameTorreta(e:Event):void{
			var angleRadian=Math.atan2(mouseY-torreta.y,mouseX-torreta.x);
			//var angleDegree = angleRadian * 180 / Math.PI;
			torreta.rotation = angleRadian;
			//trace( Math.round(angleDegree) + "°");
		}
		
		
		private function onEnterFrame(e:Event):void 
		{
			scoreText.text = "Score: " + score;
			frames ++;
			//20 FRAMES UN SEGUNDO;
			trace(frames);
			if (frames >= 20 && oculto == false){
				segundos = 1;
				frames = 0;
			}else{
				segundos = 0;
			}
			//trace(fin);
			//trace(oculto);
			if (!fin && oculto == false ){
				score-= segundos;
				//trace(score);
			}
			for each(var pelota in enemigos){
				ballMovement(pelota);
				ballCollision(pelota);
			}
			
			if(enemigos.length == 0 && !fin){//Cuando ya no quedan enemigos, el jugador ha ganado.
				trace("Ya has ganado xD");
				//this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "NivelCompletado"}, true));
				levelfinalScoreText.text  = "Level Score: \n" + score;
				GlobalScore.totalScore += score;
				if(score > 1000){
					feedBackText.text = "Perfecto, has hecho una buena puntuación, pero aun así eres tonto";
				}else if(score <= 1000 && score > 900){
					feedBackText.text = "Aun eres un pedazo de manco impresionante, pero no esta todo perdido";
				}else if(score <900){
					feedBackText.text = "Mira tio, eres mas malo que pegar a un pare con un calcetin usado, jubilate ya, o juega al parchis";
				}
				totalFinalScoreText.text = "Total Score:\n" + GlobalScore.totalScore;
				buttonNewLevel.visible = true;
				levelCompleteText.visible = true;
				sonido.playStopTemita(false);
				fin = true;
				
			}
			
		}
		
	
		
		public function onButtonTriggered(e:Event):void{
			
			var button:Button = e.target as Button;
			if (button.name == "NextLevel") {
				trace("Dentro");
				this.dispatchEvent(new Navigation.NavigationEvent(Navigation.NavigationEvent.CHANGE_SCREEN, {id: "levelComplete"}, true));
				
			}
		}
		
		public function ballCollision(pelota:GameObjects.Ball){
			for each (var otherBall in enemigos){
				/*if(otherBall.x > pelota.x - pelota.width / 2 && otherBall.x < pelota.x + pelota.width / 2 &&
					otherBall.y > pelota.y - pelota.height / 2 && otherBall.y < pelota.y + pelota.height / 2){//Si colisiona con una pelota enemiga, que rebote.*/
				if(otherBall.getBounds(otherBall.parent).intersects(pelota.getBounds(pelota.parent))){		
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
		
		private function ballMovement(pelota:GameObjects.Ball):void{

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
