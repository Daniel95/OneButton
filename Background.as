package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event; //import toevoegen
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	public class Background extends Sprite
	{
		[Embed(source = "../lib/background.png")]
		private var BackgroundImage:Class;
		
		private var bgImage:Bitmap
		
		public function Background() 
		{

			//constructor
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			//event listener maken
			
			
		}
		private function init(e:Event = null):void
		{
			bgImage = new BackgroundImage();
			addChild(bgImage);
		}
		
	}
        
}