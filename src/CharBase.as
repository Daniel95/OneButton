package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Daniël Brand
	 */
	public class CharBase extends MovieClip//in dit script komen de overeenkomsten van de player en anderen characters
	//bv dat als je tegen een muur aan loop, dat je dan de anderen richting op gaat
	{
		public var lives:int = 6;
		private var speed:int = 5;
		private var jump:int = 4;
		public static var gravity:int;
		private var _chests:Vector.<Chest>;
		private var controlState:String;
		
		public static const STATE_45_DEGREES:String = "45 degrees";
		public static const STATE_FLAPPY:String = "flappy";
		
		public function CharBase(chests:Vector.<Chest> = null)
		{
			_chests = chests;
			this.addEventListener(Event.ENTER_FRAME, loop);	
			
			//addEventListener(Event.ENTER_FRAME, loop);
			
			controlState = STATE_45_DEGREES;
			
			
		}
		
		public function switchControls(newControls:String):void
		{
			controlState = newControls;
		}
		
		public function loop(e:Event):void 
		{		
			switch(controlState)
			{
				case STATE_45_DEGREES:
					this.x += speed;
					this.y += gravity;
				break;
				case STATE_FLAPPY:
					this.x += speed;
					this.y += jump;
				break;
				
			}
			//trace(speed);
			deadEnd();
		
			
			
			
		}
		public function destroy():void//als je een character dood gaat.
		{
			this.removeEventListener(Event.ENTER_FRAME, loop);
		}
		public function deadEnd():void
		{
			var length:int = _chests.length;
			for (var i:int = 0; i < length;i++ )
			{
				if (this.hitTestObject(_chests[i]))//checken voor collision
				{
					//draait om:
					if (speed > 0)
					{
						speed = -5;
					}
					else
					{
						speed = 5;
					}
				}
			}
			
		}
	}

}