package{

	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	import Navigation.Game;
	
	/**
	 * ...
	 * @author JesúsDavid
	 */
	[SWF(width="900", height="675", frameRate="60", backgroundColor="#002143")]
	public class Main extends Sprite 
	{
		private var mStarling:Starling;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			mStarling = new Starling(Navigation.Game, stage);
			mStarling.antiAliasing = 3;
			mStarling.start();
		}
		
	}
	
}