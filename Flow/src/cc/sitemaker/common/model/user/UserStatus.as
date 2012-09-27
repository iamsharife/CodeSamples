package cc.sitemaker.common.model.user
{
	public class UserStatus
	{
		public static var SITE_OWNER:UserStatus = new UserStatus("CO");  // Community Owner
		public static var SITE_ADMIN:UserStatus = new UserStatus("CA");  // Community Admin
		public static var SITE_MEMBER:UserStatus = new UserStatus("CM"); // Community Memeber
		public static var PENDING:UserStatus = new UserStatus("RM"); 	 // Pending Memeber
		public static var GUEST:UserStatus = new UserStatus("GU");		 // Guest
		public static var BANNED:UserStatus = new UserStatus("BA");		 // Banned
		
		private var _code : String;
		
		public function UserStatus(code:String) {
			_code = code;
		}
		
		public function toString():String{
			return _code;
		}
		
		public function equals(userStatus:UserStatus):Boolean{
			return _code == userStatus.toString();
		}
	}
}