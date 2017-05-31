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
		
		var myTrackFreeze:Sound = new Sound();
		var myChannelFreeze:SoundChannel = new SoundChannel();
		
		var myTrackUnfreeze:Sound = new Sound();
		var myChannelUnfreeze:SoundChannel = new SoundChannel();
		
		public function GlobalSound(){
			
			myTrackTemita.load(new URLRequest("../media/sounds/temita.mp3")); 

			myTrackPium.load(new URLRequest("../media/sounds/piumpium.mp3")); 
			myTrackExplosion.load(new URLRequest("../media/sounds/explosion.mp3")); 
			
			myTrackFreeze.load(new URLRequest("../media/sounds/congelar.mp3")); 
			myTrackUnfreeze.load(new URLRequest("../media/sounds/descongelar.mp3")); 
		}
		
		public function playStopExplosion(play:Boolean) 
		{
			
			if(play){
				myChannelExplosion = myTrackExplosion.play();
			}else{
				myChannelExplosion.stop();
			}
		}
		
		public function playStopFreeze(play:Boolean) 
		{
			
			if(play){
				myChannelFreeze = myTrackFreeze.play();
			}else{
				myChannelFreeze.stop();
			}
		}
		
		public function playStopUnfreeze(play:Boolean) 
		{
			
			if(play){
				myChannelUnfreeze = myTrackUnfreeze.play();
			}else{
				myChannelUnfreeze.stop();
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