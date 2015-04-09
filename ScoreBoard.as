package  
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Ferry Elbaghdadi
	 */
	public class ScoreBoard extends TextField
	{
		public static var _score:int;
		/*
		public function set score(s:Number)	{
			_score = s;
			this.text = "score : " + _score;
		}
		public function get score():Number0
		{
			return _score;
		}
		*/
		public function ScoreBoard() 
		{ //constructor
			addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.defaultTextFormat = new TextFormat("Tandysoft", 30, 0xFF0000, true);
			this.width = stage.stageWidth;
			//this.text = "Score : " + _score;
		}
		public function loop(e:Event):void 
		{
			this.text = "Score : " + _score;
		}
	}
		
}

