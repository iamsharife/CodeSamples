package cc.sitemaker.utilities.instructions.model.vo
{
	public class Instruction {
		
		public var targetName:String;
		public var instruction:String;
		public var data:Object;
		public var callback:Function;
		
		public function toString():String{
			return "[targetName=" + targetName + " instruction=" + instruction + " data=" + data + "]";
		}
	}
}