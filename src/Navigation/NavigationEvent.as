package Navigation 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_SCREEN:String = "changeScreen";
		public static const CHANGE_SOUND:String = "changeSound";
		public var params:Object;
		public function NavigationEvent(type:String, _params:Object = null, bubbles:Boolean=false, data:Object=null) 
		{ 
			super(type, bubbles, data);
			this.params = _params;
		}
		
	}

}