package 
{
import flash.display.MovieClip;
	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class Player extends MovieClip
	{
		
		private var player:MovieClip;

    public function Player()
    {

        this.addEventListener(Event.ADDED_TO_STAGE,onStage);

    }
    private function onStage(e:Event)
    {

        /*stage.addEventListener(KeyboardEvent.KEY_DOWN, on_key_down);
        stage.addEventListener(KeyboardEvent.KEY_UP, on_key_up);*/
        this.addEventListener(Event.ENTER_FRAME,on_enter_frame);
        removeEventListener(Event.ADDED_TO_STAGE,onStage);
    }

    private function on_enter_frame(e:Event)
    {

        var dist_Y:Number =stage.mouseY -this.y ;
        var dist_X:Number =stage.mouseX -this.x ;
        var angle:Number = Math.atan2(dist_Y,dist_X);
        var degrees:Number = angle * 180/ Math.PI;
        this.rotation = degrees;

    }

		
	}

}