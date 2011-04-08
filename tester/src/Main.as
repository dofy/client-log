package 
{
    import com.ku6.utils.ClientlLog;
	import flash.display.Sprite;
	import flash.events.Event;
    import flash.text.TextField;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
            
            var t:TextField = new TextField();
            t.width = stage.stageWidth;
            t.height = stage.stageHeight;
            addChild(t);

            ClientlLog.record('{t}');
            ClientlLog.record(ClientlLog.LONG_LINE);
            ClientlLog.record('{t}\t{0} is {1} {0}\n\n', 'Apple', 'an');
            
            t.appendText(ClientlLog.log);
            
            ClientlLog.clear();
            
            ClientlLog.record('blah blah blah...');
            
            t.appendText(ClientlLog.log);
            
            t.appendText(ClientlLog.NEW_LINE + ClientlLog.LONG_LINE + ClientlLog.NEW_LINE);
            
            t.appendText(ClientlLog.time.toString());
		}
		
	}
	
}