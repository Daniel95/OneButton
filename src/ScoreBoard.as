package  
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Ferry
	 */
	public class ScoreBoard extends TextField
	{
		//[Embed(source = "../lib/BADABB.TTF")]
		//private var Font:Class;
		
		private var _score:Number = 0;
		
		public function set score(s:Number)	{
			_score = s;
			this.text = "score : " + _score;
		}
		public function get score():Number
		{
			return _score;
		}
		public function ScoreBoard() 
		{ //constructor
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.defaultTextFormat = new TextFormat("BADABB", 30, 0xFF0000, true);
			this.width = stage.stageWidth;
			this.text = "Score : " + _score;
		}
		}
		
	}

