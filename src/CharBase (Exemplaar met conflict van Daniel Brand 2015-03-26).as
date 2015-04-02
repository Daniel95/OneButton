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
		private var speed:int = 8;
		private var gravity = 2;
		private var _chests:Vector.<Chest>;
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		public function CharBase(chests:Vector.<Chest> = null)
		{
			_chests = chests;
			this.addEventListener(Event.ENTER_FRAME, loop);	
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		public function loop(e:Event):void 
		{
			this.y += gravity;
			this.x += speed;
			
			
			//trace(speed);
			deadEnd();
		}
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode != 32)
			{
				gravity - (gravity * 2);
			}
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
						speed = -8;
					}
					else
					{
						speed = 8;
					}
				}
			}
		}
	}
}