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
		
		[Embed(source = "../media/images/cañon.png")]
		public static const canon:Class;
		
		[Embed(source = "../media/images/base_cañon.png")]
		public static const base_canon:Class;
		
		[Embed(source = "../media/images/disparo.png")]
		public static const disparo:Class;
		
		[Embed(source = "../media/images/bola_normal.png")]
		public static const bola_normal:Class;
		//
		[Embed(source = "../media/images/play.png")]
		public static const play:Class;
		
		[Embed(source = "../media/images/credits.png")]
		public static const credits:Class;
		
		[Embed(source = "../media/images/options.png")]
		public static const options:Class;
		
		[Embed(source = "../media/images/title.png")]
		public static const title:Class;
		
		[Embed(source = "../media/images/exit.png")]
		public static const exit:Class;
		
		[Embed(source = "../media/images/backgroundMenu.png")]
		public static const backgroudMenu:Class;
		
		[Embed(source = "../media/images/OPTIONS_title.png")]
		public static const OPTIONS_title:Class;
		
		[Embed(source = "../media/images/soundOn.png")]
		public static const soundOn:Class;
		
		[Embed(source = "../media/images/soundOff.png")]
		public static const soundOff:Class;
		
		/*[Embed(source = "../media/Fondos/instructions.png")]
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
