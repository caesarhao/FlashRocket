package libraries
{
    import flash.globalization.DateTimeFormatter;

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
        public static function init():void{
            
        }
        public static function print(msg : String):void{
            trace(msg);
        }
        public static function datetime():String{
            var df:DateTimeFormatter = new DateTimeFormatter("");
            df.setDateTimePattern("yyyy-MM-dd HH:mm:ss")
            return df.format(new Date());
        }
        public static function date():String{
            var df:DateTimeFormatter = new DateTimeFormatter("");
            df.setDateTimePattern("yyyy-MM-dd")
            return df.format(new Date());
        }
        public static function time():String{
            var df:DateTimeFormatter = new DateTimeFormatter("");
            df.setDateTimePattern("HH:mm:ss")
            return df.format(new Date());
        }
        public static function debug(msg : String):void{
            if(Debug.debugLevel > Debug.DEBUG)
                return;
            print(datetime() + " [DEBUG " + msg);
        }
        public static function info(msg : String):void{
            if(Debug.debugLevel > Debug.INFO)
                return;
            print(datetime() + " [INFO] " + msg);
        }
        public static function warn(msg : String):void{
            if(Debug.debugLevel > Debug.WARN)
                return;
            print(datetime() + " [WARN] " + msg);
        }
        public static function error(msg : String):void{
            if(Debug.debugLevel > Debug.ERROR)
                return;
            print(datetime() + " [ERROR] " + msg);
        }
        public static function fatal(msg : String):void{
            if(Debug.debugLevel > Debug.FATAL)
                return;
            print(datetime() + " [FATAL] " + msg);
        }
        
    }
}
