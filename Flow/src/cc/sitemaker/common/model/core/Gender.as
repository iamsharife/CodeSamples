package cc.sitemaker.common.model.core
{
	public class Gender
	{
		public static var MALE:Gender = new Gender("M");
		public static var FEMALE:Gender = new Gender("F");
		
		private var _code:String;
		
		public function Gender(code:String) {
			_code = code;
		}
		
		public function toString():String{
			return _code;
		}
		
		public function equals(gender:Gender):Boolean{
			return _code == gender.toString();	
		}
	}
}