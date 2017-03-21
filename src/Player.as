package 
{
import flash.geom.Point;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.events.Event;
import starling.core.Starling;
import starling.display.Image;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import flash.events.MouseEvent;

	/**
	 * ...
	 * @author JesúsDavid
	 */
	public class Player extends Sprite
	{
		
		private var player:MovieClip;
		private var canon:Image;
		private var base_canon:Image;
		private var mouseX:Number;
		private var mouseY:Number;
		
		
    public function Player()
    {

        this.addEventListener(Event.ADDED_TO_STAGE, onStage);
		/*addEventListener(MouseEvent.MOUSE_MOVE, loo)*/

    }
    private function onStage(e:Event):void
    {

        /*stage.addEventListener(KeyboardEvent.KEY_DOWN, on_key_down);
        stage.addEventListener(KeyboardEvent.KEY_UP, on_key_up);*/
		base_canon = new Image(Assets.getTexture("base_canon"));
		addChild(base_canon)
		canon = new Image(Assets.getTexture("canon"));
		addChild(canon);
		
        this.addEventListener(Event.ENTER_FRAME,on_enter_frame);
        removeEventListener(Event.ADDED_TO_STAGE, onStage);
		
    }

	private function onTouch(e:TouchEvent):void
	{
		var touches:Vector.<Touch> = e.getTouches(this);
 
            for each (var touch:Touch in touches)
            {
                if (touch.phase == TouchPhase.HOVER )
				{
					var location:Point = touch.getLocation(this);
					mouseX = location.x;
					mouseY = location.y;
				}
			}
	}
	
	
    private function on_enter_frame(e:Event):void
    {
		/*var mousePosition:Point = new Point();

        var dist_Y:Number =mouseY-this.y ;
        var dist_X:Number =mouseX -this.x ;
        var angle:Number = Math.atan2(dist_Y,dist_X);
        var degrees:Number = angle * 180/ Math.PI;
        this.rotation = degrees;
		trace(this.y);*/
		
    }

		
	}

}