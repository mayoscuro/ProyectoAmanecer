package Sound 
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class GlobalSound 
	{	
		public static function playStopExplosion(play:Boolean) 
		{
			var myTrack:Sound = new Sound();
			var myChannel:SoundChannel = new SoundChannel();
			myTrack.load(new URLRequest("../media/sounds/explosion.mp3")); // make sure you use the proper path!
			if(play){
				myChannel = myTrack.play();
			}else{
				myChannel.stop();
			}
		}
		
		public static function playStopPiumPium(play:Boolean){
			var myTrack:Sound = new Sound();
			var myChannel:SoundChannel = new SoundChannel();
			myTrack.load(new URLRequest("../media/sounds/piumpium.mp3")); // make sure you use the proper path!
			if(play){
				myChannel = myTrack.play();
			}else{
				myChannel.stop();
			}
		}
		
		public static function playStopTemita(play:Boolean){
			var myTrack:Sound = new Sound();
			var myChannel:SoundChannel = new SoundChannel();
			myTrack.load(new URLRequest("../media/sounds/temita.mp3")); // make sure you use the proper path!
			
			if (play){
				myChannel = myTrack.play();
			}else{
				myChannel.stop();
			}
		}
		
	}

}