package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Daniël Brand
	 */
	 
	public class DieBlock extends Sprite
	{
		
		public static var dieBlock:dieBlockArt;
		private var randomSpawn:int;
		
		public function DieBlock() 
		{
			//dieBlock.x = 400;//Math.random() * 500;
			//dieBlock.y = 400;
			//this.scaleX = this.scaleY = 100000;//de groote van het de player
		}
		
		function loop ()
		{
			//randomSpawn = Math.random();
			//if (randomSpawn < 0.5)
			//{
				makedieBlock();
			//}
		}
		
		
		function makedieBlock()
		{
			dieBlock = new dieBlockArt;
			this.addChild(dieBlock);
			dieBlock.x = 400;//Math.random() * 500;
			dieBlock.y = 400;
			this.scaleX = this.scaleY = 100000;//de groote van het de player
			
		}
		
		//setInterval(makedieBlock, 2500);
		
	}

}