package
{
    import com.ku6.utils.ClientlLog;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.ErrorEvent;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var output:TextField = new TextField();
        
        
        public function Main():void
        {
            if (stage)
                init();
            else
                addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            // entry point
            
            stage.addEventListener(Event.RESIZE, resizeHandler);
            
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            output.defaultTextFormat = new TextFormat('courier new');
            addChild(output);
            resizeHandler();
            
            ClientlLog.record('{t}\tsome log...');
            ClientlLog.record('{t}\t{0} is {1} {0}\n\n', 'Apple', 'an');
            
            output.appendText(ClientlLog.log);
            
            ClientlLog.clear();
            
            ClientlLog.record('1.blah blah blah...');
            ClientlLog.record('2.blah blah blah...');
            
            output.appendText(ClientlLog.log);
            
            output.appendText(ClientlLog.NEW_LINE + ClientlLog.LONG_LINE + ClientlLog.NEW_LINE);
            
            output.appendText(ClientlLog.id);
            
            ClientlLog.send('log.php', function(evt:Event):void
                {
                    output.appendText(ClientlLog.NEW_LINE + 'Log sent.');
                }, function(evt:ErrorEvent):void
                {
                    output.appendText(ClientlLog.NEW_LINE + 'Log send error:' + evt.text);
                });
        }
        
        private function resizeHandler(e:Event = null):void
        {
            output.width = stage.stageWidth;
            output.height = stage.stageHeight;
        }
    
    }

}