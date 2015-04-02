package  
{
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Daniël Brand
	 */
	public class Main extends Sprite //in dit script gaan we alles spawnen
	{
		public static var player:Player;
		private var enemies:Array;
		private var chests:Vector.<Chest>;
		
		public var dieBlock:DieBlock;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			chests = new Vector.<Chest>();
			
			
			for (var i:int = 0; i < 2; i++)
			{
				chests.push(new Chest());
				this.addChild(chests[i]);
			
				chests[i].x = 0 + (i*1279);
				chests[i].y = 300;
			}
			
			player = new Player(chests);//hier geven we de chests vector mee aan player
			this.addChild(player);
			
			player.x = 350;
			player.y = 300;
			
			//if (this.hitTestObject(Chest)){	
			player.switchControls(CharBase.STATE_45_DEGREES);
			//}
			
			
			dieBlock = new DieBlock;
			this.addChild(dieBlock);
		}
	}

}