package  
{
    import com.ku6.utils.ClientlLog;
	import flash.display.Sprite;
    import flash.text.TextField;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Tester extends Sprite 
    {
        
        public function Tester() 
        {
            var t:TextField = new TextField();
            t.width = stage.stageWidth;
            t.height = stage.stageHeight;
            addChild(t);
            
            ClientlLog.record('{t}');
            ClientlLog.record('{t}\t{1}, {5}', 1, 2, 3);
            
            t.text = ClientlLog.log;
        }
        
    }

}