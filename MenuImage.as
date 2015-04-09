package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event; //import toevoegen
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	public class MenuImage extends Sprite
	{
		[Embed(source = "../lib/test.png")]
		private var MenuIMG:Class;
		
		private var menuImage:Bitmap;
		
		public function MenuImage() 
		{

			//constructor
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			//event listener maken
			
			
		}
		private function init(e:Event = null):void
		{
			menuImage = new MenuIMG();
			addChild(menuImage);
		}
		
	}
        
}