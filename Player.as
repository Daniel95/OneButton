package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.ui.Keyboard;
	import flash.geom.ColorTransform;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Daniël Brand
	 */
	public class Player extends Sprite
	//bv dat als je tegen een muur aan loop, dat je dan de anderen richting op gaat
	{
		private var speed:int = 5;
		private var jump:int = 4;
		private var playerMovement:int;
		
		private var scoreSound: Sound;
		private var jumpSound: Sound;
		private var soundChannel: SoundChannel;
		
		public var player:PlayerArt;
		
		private var keyCd:int;
		
		private var goingRight:Boolean;
		
		private var gravity:int = 5;
		private var _chests:Vector.<Chest>;
		private var controlState:String;
		
		//private var dieBlockvalue:DieBlock;
		


		
		private var myColor:ColorTransform;
		
		public function Player(chests:Vector.<Chest> = null)
		{	
			_chests = chests;
			
			if (chests == null) throw new Error("geen Vector chests meegegeven aan subclass van CharBase");
			
			player = new PlayerArt();
			this.addChild(player);
			this.scaleX = this.scaleY = 0.2;//de groote van het de player
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			scoreSound = new Sound();
			scoreSound.load(new URLRequest("../audio/score.mp3"));
			jumpSound = new Sound();
			jumpSound.load(new URLRequest("../audio/jump.mp3"));
		}
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			this.addEventListener(Event.ENTER_FRAME, loop);
			

		}
		
		public function loop(e:Event):void 
		{
			if (keyCd > 0)
			{
				keyCd--;
			}
			if (playerMovement == 3)
			{
				if (gravity > 0)
				{
					gravity *= -1;
				}
				this.x += speed;
				this.y += gravity * 1.3;
				this.y -= jump;
				jump -= jump / 10;
			}
			if (playerMovement == 2)
			{
				if (goingRight)
				{
					if (speed < 5)
					{
						speed++;
					}
				}
				if (goingRight == false)
				{
					if (speed > -5)
					{
						speed--;
					}
				}
				this.x += speed;
			}
			if (playerMovement == 0)
			{
				this.x += speed;
				this.y -= gravity;
			}
			if (playerMovement == 1)
			{
				if (gravity > 0)
				{
					gravity *= -1;
				}
				this.x += speed;
				this.y -= gravity * 1.5;
				this.y -= jump;
				jump -= jump / 10;
			}
			if (this.y > stage.stageHeight) 
			{
				gravity *= -1;
				if (this.y > (stage.stageHeight + 20))
				{
					this.y = 600;
				}
			}
			if (this.y < 0)
			{
				gravity *= -1;
				if (this.y < (0 - 20))
				{
					this.y = 100;
				}
			}
			if (ScoreBoard._score == 0)
			{
				if (speed > 0)
				{
					speed = 5;
				}
				if (speed < 0)
				{
					speed = -5;
				}
			}
			deadEnd();
		}
		private function onKey(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32)//Hier moet springen komen
			{
				soundChannel = jumpSound.play(0, 1);	   
				if (playerMovement == 2 && keyCd <= 10)
				{
					
					keyCd += 15;
					if (goingRight)
					{
						speed -= 12 + (ScoreBoard._score * 0.12);
					}
					if (goingRight == false)
					{
						speed += 12 + (ScoreBoard._score * 0.12);
					}
				}
				if (playerMovement == 0)
				{
					gravity  *= -1;	
				}
				if (playerMovement == 1)
				{
					jump = 20;
				}
				if (playerMovement == 3)
				{
					jump = -20;
				}
			}
		}
		public function deadEnd():void
		{
			var length:int = _chests.length;
			for (var i:int = 0; i < length;i++ )
			{
				if (this.hitTestObject(_chests[i]))//checken voor collision
				{
					soundChannel = scoreSound.play(0, 1);	
					var myColor:ColorTransform = new ColorTransform(1, 1, 1, 1,Math.random()*510-255,Math.random()*510-255,Math.random()*510-255);
					this.transform.colorTransform = myColor;
					//draait om:
					playerMovement++;
					if (playerMovement >= 4)
					{
						playerMovement = 0;
					}
					if (speed > 0)
					{
						if (speed < 15)
						{
							speed *= -1 - (ScoreBoard._score * 0.07);
						}
						else
						{
							speed *= -1;
						}
					}
					else
					{
						if (speed > -15)
						{
							speed *= -1 - (ScoreBoard._score * 0.07);
						}
						else
						{
							speed *= -1;
						}
					}
					if (playerMovement == 2)
					{
						keyCd = 20;
						if (speed > 0)
						{
							goingRight = true;
						}
						if (speed < 0)
						{
							goingRight = false;
						}
					}
					ScoreBoard._score += 1;
				}
			}
			
		}
	}

}