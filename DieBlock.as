package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Daniël Brand
	 */
	 
	public class DieBlock extends Sprite
	{
		
		public var dieBlock:dieBlockArt;
		private var dieBlockSpeed:Number = (Math.random() * 5) + 1.5;
		

		public function DieBlock()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			dieBlock = new dieBlockArt();
			this.addChild(dieBlock);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.y = 300;
			this.x = (Math.random() * 650) + 310;
			this.scaleX = this.scaleY = Math.random() / 4 + 0.15;//de groote van het de player
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
			this.y += dieBlockSpeed;
			if (this.y > stage.stageHeight) 
			{
				if (dieBlockSpeed < 20)
				{
					dieBlockSpeed *= -1 - (ScoreBoard._score * 0.025);
				}
				else
				{
					dieBlockSpeed *= -1;
				}
			}
			if (this.y < 0)
			{
				if (dieBlockSpeed > -20)
				{
					dieBlockSpeed *= -1 - (ScoreBoard._score * 0.025);
				}
				else
				{
					dieBlockSpeed *= -1;
				}
			}
			if (ScoreBoard._score == 0)
			{
				if (dieBlockSpeed > 0)
				{
					dieBlockSpeed = (Math.random() * 5) + 2;
				}
				if (dieBlockSpeed < 0)
				{
					dieBlockSpeed = (Math.random() * -5) + -2;
				}
			}
		}
	}

}