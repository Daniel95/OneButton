package  
{
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Daniel Brand
	 */
	
	 
	public class Player extends CharBase//dit script controlled de player
	{
		private var key:int;
		private var speed:int = 3;
		private var jump:int;
		public static var player:PlayerArt;
		
		public function Player(chests:Vector.<Chest> = null):void
		{
			super(chests);//geeft de chests vector mee aan charbase 
			
			if (chests == null) throw new Error("geen Vector chests meegegeven aan subclass van CharBase");
			
			CharBase.gravity = 5;
			
			player = new PlayerArt();
			this.addChild(player);
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.scaleX = this.scaleY = 0.2;//de groote van het de player
		}		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}		
			
		override public function loop(e:Event):void 
		{	//het links & rechts bewegen van de speler wordt in charBase gedaan, in script gebeurt nu nog niks kwa gameplay
			super.loop(e);//zorgt ervoor dat de code in charbase loop ook nog wordt uitgevoert, deze loop functie gaat door op de loop functie van CharBase	
		}
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32)//Hier moet springen komen
			{
				CharBase.gravity -= (CharBase.gravity * 2);	
			}
		}	
		override public function destroy():void//als de speler dood gaat:
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			super.destroy();
		}
	}

}