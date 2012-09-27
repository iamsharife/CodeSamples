package cc.sitemaker.common.flow
{
	[Bindable]
	public class StateProperty {
		
		public var key:String;
		public var value:*;
		public var valueFunction:Function;
		public var error:String="";		
		
		public function StateProperty(){
		}
		
		public function getValue():*{
			if (valueFunction is Function){
				return valueFunction();
			}
			else{
				return value;
			}
		}
				
		public static function GetProperty(stateProperties:Vector.<StateProperty>, key:String):StateProperty{
			for (var i:int = 0; i<stateProperties.length; i++){
				if (stateProperties[i].key == key){
					return stateProperties[i];
				}
			}		
			return null;
		}
		
		public static function ClearErrors(stateProperties:Vector.<StateProperty>):void{
			for (var i:int = 0; i<stateProperties.length; i++){
				stateProperties[i].error = "";
			}
		} 
		
		public static function HasErrors(stateProperties:Vector.<StateProperty>):Boolean{
			// Only need to find one error to be true
			for (var i:int = 0; i<stateProperties.length; i++){
				if (stateProperties[i].error != ""){
					return true;
				}
			}
			return false;
		}
	}
}