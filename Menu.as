package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.geom.ColorTransform;
	
 /**
	 * ...
	 * @author Pim
	 */
 
 public class Menu extends Sprite
 {
	 
private var menuIMG:MenuImage;	
  private var main:Main;
  private var test:Sprite;
  private var counter:Number = 0;
  public var player:PlayerArt;
  
  
  private var colorChangeCd:int;
  
  private var menuOST: Sound;
  private var soundChannel: SoundChannel;
  
  private var myColor:ColorTransform;
  
  public function Menu():void
  {
	test = new Sprite();
	player = new PlayerArt;
	addChild(test);
	stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	this.addEventListener(Event.ADDED_TO_STAGE, init);
	
	menuOST = new Sound();
	menuOST.load(new URLRequest("../audio/menu.mp3"));
  }
  
  private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			menuIMG = new MenuImage();
			addChild(menuIMG);
			
			soundChannel = menuOST.play(0, 1);
			
			menuIMG.width = stage.stageWidth;
			menuIMG.height = stage.stageHeight;
			
			addChild(player);
			player.x = 200;
			player.y = 400;
			this.addEventListener(Event.ENTER_FRAME, loop);	
		}
  
  private function loop (e:Event):void
  {
	colorChangeCd--;
	if (colorChangeCd <= 0)
	{
		var myColor:ColorTransform = new ColorTransform(1, 1, 1, 1,Math.random()*510-255,Math.random()*510-255,Math.random()*510-255);
		player.transform.colorTransform = myColor;
		colorChangeCd = 10;
	}
  }
  
  private function onKeyDown(e:KeyboardEvent):void
  {
   if (e.keyCode == Keyboard.SPACE)
   {
    if (counter == 0)
    {
     counter = 1;
     main = new Main();
     addChild(main);
	 soundChannel.stop();
    }

   }
  }
  
 }
}