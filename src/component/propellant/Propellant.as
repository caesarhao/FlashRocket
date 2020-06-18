package component.propellant
{
    public class Propellant {
/*
        protected static var _type:int;
        protected static var _temperatureK:Number;
        protected static var _densityKgM_3:Number;
        protected static var _colorRGB:uint;
        public static function get type():int{
            return _type;
        }
        public static function get temperatureK():Number{
            return _temperatureK;
        }
        public static function get temperatureC():Number{
            return (_temperatureK-273.15);
        }
        public static function get densityKgM_3():Number{
            return _densityKgM_3;
        }
        public static function get colorRGB():uint{
            return _colorRGB;
        }
*/
        public static const type:int = 0;
        public static const temperatureK:Number = 0; // K
        public static const densityKgM_3:Number = 0; // Kg/M3
        public static const colorRGB:uint = 0xFFFFFF; // colorless

        public static function propellant(propellantType: int):Class{
            switch(propellantType){
            case PropellantType.LOX:
                return LOX;
                break;
            case PropellantType.LH2:
                return LH2;
                break;
            case PropellantType.RP1:
                return RP1;
                break;
            case PropellantType.N2O4:
                return N2O4;
                break;
            case PropellantType.N2H4:
                return N2H4;
                break;
            case PropellantType.CH4:
                return CH4;
                break;
            default:
                return Propellant;
                break;
            }
        }
    }
}
