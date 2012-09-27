package cc.sitemaker.common.flow
{
	[DefaultProperty("properties")]
	
	public class StateProperties {
		
		[ArrayElementType("cc.sitemaker.common.flow.StateProperty")]
		public var properties:Array;
		
		public function StateProperties(){
		}
			
		public function getProperty(key:String):StateProperty{
			// Look for specific property based on key
			for (var i:int = 0; i<properties.length; i++){
				var sP:StateProperty = (properties[i] as StateProperty);
				if (sP.key == key){
					return sP;
				}
			}
			// no such property
			return null;	
		}
		
		public function clearErrors():void{
			for (var i:int = 0; i<properties.length; i++){
				(properties[i] as StateProperty).error = "";
			}
		}
	}
}