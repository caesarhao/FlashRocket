package libraries
{
    import flash.net.FileReference;

    public final class Debug{
        private static var ENUM_VAL_NUM : int = 0;
        public static const ALL: int = ENUM_VAL_NUM++;
        public static const DEBUG: int = ENUM_VAL_NUM++;
        public static const INFO: int = ENUM_VAL_NUM++;
        public static const WARN: int = ENUM_VAL_NUM++;
        public static const ERROR: int = ENUM_VAL_NUM++;
        public static const FATAL: int = ENUM_VAL_NUM++;
        public static const OFF: int = 255;
        public static var debugLevel : int = Debug.OFF;
        public function Debug(){
            throw new ArgumentError("Debug cannot be instanicated.");
        }
        public static function init(fileName : String = "debug.txt"):void{
            
        }
        public static function trace(msg : String):void{

        }
        public static function debug(msg : String):void{
            if(Debug.debugLevel > Debug.DEBUG)
                return;
            
        }
        public static function info(msg : String):void{
            if(Debug.debugLevel > Debug.INFO)
                return;
            
        }
        public static function warn(msg : String):void{
            if(Debug.debugLevel > Debug.WARN)
                return;
            
        }
        public static function error(msg : String):void{
            if(Debug.debugLevel > Debug.ERROR)
                return;
            
        }
        public static function fatal(msg : String):void{
            if(Debug.debugLevel > Debug.FATAL)
                return;
            
        }
        
    }
}
