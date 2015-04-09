package  
{
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Daniël Brand
	 */
	public class Main extends Sprite //in dit script gaan we alles spawnen
	{
		public var player:Player;
		private var background:Background;
		private var chests:Vector.<Chest>;
		private var dieBlocks:Array;
		private var blockNumber:Number;
		
		
		public var scoreboard:ScoreBoard;
		
		private var dieSound: Sound;
		private var soundChannel: SoundChannel;
		
		private var musicS: Sound;
		
		private var dieSoundTimer:int;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, loop);
			
			dieSound = new Sound();
			dieSound.load(new URLRequest("../audio/die.mp3"));
			musicS = new Sound();
			musicS.load(new URLRequest("../audio/music.mp3"));
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			soundChannel = musicS.play(0, 1);	     
			background = new Background();
			addChild(background);
			
			background.width = stage.stageWidth;
			background.height = stage.stageHeight;
			
			chests = new Vector.<Chest>();
			/*
			if (player.hitTestObject(_chests[i])) {
			scoreboard.score += 5;
				}
			*/
			for (var i:int = 0; i < 2; i++)
			{
				chests.push(new Chest());
				this.addChild(chests[i]);
			
				chests[i].x = 0 + (i*1279);
				chests[i].y = 300;
			}
			
			player = new Player(chests);//hier geven we de chests vector mee aan player
			this.addChild(player);
			
			player.x = 50;
			player.y = 300;
			
			//player.switchControls(Player.STATE_45_DEGREES);
				
			scoreboard = new ScoreBoard();
			addChild(scoreboard);
			
			scoreboard.x = 550;
			
			dieBlocks = new Array();
			spawnDieBlocks();
			this.addEventListener(Event.ENTER_FRAME, loop);	
		}
		
		private function spawnDieBlocks():void
		{
			for (var i:int = 0; i < 8; i++ )
			{
				dieBlocks.push(new DieBlock());
				this.addChild(dieBlocks[i]);
			}
		}
		public function loop(e:Event):void 
		{
			if (dieSoundTimer > 0)
			{
				dieSoundTimer--;
			}
			var length:int = dieBlocks.length;
			for (var i:int = length - 1; i >= 0; i--) 
			{
				if (player.hitTestObject(dieBlocks[i]))//checken voor collision
				{
					ScoreBoard._score = 0;
					if (dieSoundTimer <= 0)
					{
						dieSoundTimer = 10;
						trace("You Died.");
						soundChannel = dieSound.play(0, 1);
					}
				}
				
			}
		}
	}
}