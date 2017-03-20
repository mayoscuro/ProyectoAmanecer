package 
{	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.display.Image;
	import starling.textures.Texture;

	public class Assets 
	{
		
		private static var gameTexture:Dictionary = new Dictionary();
		
		[Embed(source = "../media/images/background.png")]
		public static const background:Class;
		
		/*[Embed(source = "../media/Fondos/play_pequeño.png")]
		public static const playpeque:Class;
		
		[Embed(source = "../media/Fondos/seleccion_pequeña.png")]
		public static const selecpeque:Class;
		
		[Embed(source = "../media/Fondos/Instruciones.png")]
		public static const instruciones:Class;
		
		[Embed(source = "../media/Fondos/play.png")]
		public static const play:Class;
		
		[Embed(source = "../media/Fondos/instructions.png")]
		public static const instructions:Class;
		
		[Embed(source = "../media/Fondos/seleccion.png")]
		public static const seleccion:Class;
		
		[Embed(source = "../media/Fondos/Game Over.png")]
		public static const lose:Class;
		
		[Embed(source = "../media/Fondos/Welcome.png")]
		public static const welcome:Class;
		
		[Embed(source = "../media/Fondos/vortex.png")]
		public static const vortex:Class;
		
		[Embed(source = "../media/Fondos/espacio.png")]
		public static const space:Class;
		
		[Embed(source = "../media/Fondos/espacio 2.png")]
		public static const space2:Class;
		
		[Embed(source = "../media/Fondos/espacio 3.png")]
		public static const space3:Class;
		
		[Embed(source = "../media/Images/Nave vidas.png")]
		public static const lifes:Class;*/
		
		public static function getTexture(name:String):Texture {
		if (gameTexture[name] == undefined) {
				var bitmap:Bitmap = new Assets[name]();
				gameTexture[name] = Texture.fromBitmap(bitmap);
		}
		return gameTexture[name];
	}
		
		
	}
		
	}
