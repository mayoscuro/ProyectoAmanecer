package 
{
	import starling.display.Sprite;
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class LevelSelection extends Sprite
	{
		
		public function LevelSelection() 
		{
			
		}
		
		public function disposeTemporarily():void{
			this.visible = false;
		}
		
		public function initialize():void{
			this.visible = true;
		}
	}

}