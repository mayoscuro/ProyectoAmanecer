package{

	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	
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
			mStarling = new Starling(Level1, stage);
			mStarling.antiAliasing = 2;
			mStarling.start();
		}
		
	}
	
}