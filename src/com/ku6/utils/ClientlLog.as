package com.ku6.utils 
{
    import flash.system.Capabilities;
    
	/**
     * Client Log
     * @author Seven Yu
     */
    public final class ClientlLog 
    {
        
        // 时间标记
        public static const TAG_TIME:String = '{t}';
        
        // 制表符
        public static const TAB:String = '\t';
        
        // 换行
        public static const NEW_LINE:String = '\n';
        
        // 分割线
        public static const LONG_LINE:String = '-------------------------------------------------';
        
        
        // 保存日志数据
        private static var _arrLogs:Array = [];
        
        // 系统信息
        private static var _systemInfo:Array;
        
        
        /**
         * 增加一条日志
         * ClientLog.record('for example: {0} is {1} {0}.', 'Apple', 'an');
         * // result: for example: Apple is an Apple.
         * 另外有个特殊标记:
         * {t} 插入当前时间
         * TODO more tags ...
         * @param	log  日志内容 (可以是带格式模板)
         * @param	... params 替换内容模板中对应的内容
         */
        public static function record(log:String, ... params):void
        {
            for (var i:int = 0, len:int = params.length; i < len; i++) 
            {
                var reg:RegExp = new RegExp('\\{' + i + '\\}', 'g');
                log = log.replace(reg, params[i]);
            }
            
            log = log.replace(/\{t\}/ig, timeString);
            
            _arrLogs.push(log);
        }
        
        /**
         * 清除历史 log
         */
        public static function clear():void
        {
            _arrLogs = [];
        }
        
        /**
         * 返回日志信息
         */
        public static function get log():String
        {
            return systemInfo + NEW_LINE + LONG_LINE + NEW_LINE + _arrLogs.join(NEW_LINE);
        }
        
        /**
         * 系统信息
         */
        public static function get systemInfo():String 
        {
            if (!_systemInfo)
            {
                _systemInfo = [];
                _systemInfo.push('OS:\t' + Capabilities.os);
                _systemInfo.push('Player Version:\t' + Capabilities.version + (Capabilities.isDebugger ? ' (Debug Player)' : ''));
                _systemInfo.push('Player Type:\t' + Capabilities.playerType);
                _systemInfo.push('Language:\t' + Capabilities.language);
                _systemInfo.push('Screen Size:\t' + Capabilities.screenResolutionX + ' * ' + Capabilities.screenResolutionY);
            }
            
            return _systemInfo.join(NEW_LINE);
        }
        
        /**
         * 当前时间毫秒数
         */
        public static function get time():Number
        {
            return new Date().getTime();
        }
        
        /**
         * 当前时间描述字符
         */
        public static function get timeString():String
        {
            return new Date().toLocaleString();
        }
        
    }

}