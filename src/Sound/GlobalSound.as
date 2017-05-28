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
		var myTrackTemita:Sound = new Sound();
		var myChannelTemita:SoundChannel = new SoundChannel();
		
		var myTrackExplosion:Sound = new Sound();
		var myChannelExplosion:SoundChannel = new SoundChannel();
		
		var myTrackPium:Sound = new Sound();
		var myChannelPium:SoundChannel = new SoundChannel();
		
		public function GlobalSound(){
			
			myTrackTemita.load(new URLRequest("../media/sounds/temita.mp3")); // make sure you use the proper path!

			myTrackPium.load(new URLRequest("../media/sounds/piumpium.mp3")); // make sure you use the proper path!
			myTrackExplosion.load(new URLRequest("../media/sounds/explosion.mp3")); // make sure you use the proper path!
		}
		
		public function playStopExplosion(play:Boolean) 
		{
			
			if(play){
				myChannelExplosion = myTrackExplosion.play();
			}else{
				myChannelExplosion.stop();
			}
		}
		
		public function playStopPiumPium(play:Boolean){
			
			if(play){
				myChannelPium = myTrackPium.play();
			}else{
				myChannelPium.stop();
			}
		}
		
		public function playStopTemita(play:Boolean){
			if (play){
				myChannelTemita = myTrackTemita.play();
			}else{
				myChannelTemita.stop()
				
			}
		}
		
	}

}