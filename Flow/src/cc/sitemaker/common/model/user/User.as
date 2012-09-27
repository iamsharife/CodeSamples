package cc.sitemaker.common.model.user
{
	import cc.sitemaker.common.model.core.Currency;
	import cc.sitemaker.common.model.core.Gender;
	
	import mx.collections.ArrayList;

	public class User
	{
		//PROPERTIES of the User class
		public var id:Number;
		public var siteStatus:UserStatus;	// users' status in site - CL=community leader CM=community member, GU=guest, BA=banned
		public var status:UserStatus; // users' global status - CL=community leader CM=community member, GU=guest, BA=banned
		public var email:String;			// user's email address
		public var firstName:String;		// users' first name
		public var lastName:String;		// user's last name
		public var username:String;			// user's username
		public var emailVerified:Boolean; 	// user's email verification status
		public var motd:String; 
		public var userGroup:String;
		public var groupName:String;
		public var sitesAsLeader:ArrayList; // array of sites which the user is site leader for
		public var sitesAsMember:ArrayList; // array of sites which the user is a member of
		public var password:String;
		public var country:String;
		public var gender:Gender;
		public var occupation:String;
		
		public var age:Number;
		
		public var postCode:String;
		public var allowOffersEmail:Boolean; // allow emails from SiteMaker
		
		//public var featureTable:HashTable; // product-related feature set
		
		public var affiliateID:String;
		public var subscription:Subscription;
		public var currency:Currency;
		
		//CONSTRUCTOR of the User class
		public function User():void{
			id = 0;
			subscription = null;
			username = null;
			status = null;
			sitesAsLeader = new ArrayList();
			sitesAsMember = new ArrayList();
			siteStatus = null;
			email = null;
			firstName = null;
			lastName = null;
			emailVerified = false;
			motd = null;
			userGroup = null;
			groupName = null;
			password = null;
			postCode = null;
			affiliateID = null;
			allowOffersEmail = true;
			country = null;
			gender = null;
			age = 0;
			occupation = null;
			currency = null;
			//featureTable = new HashTable();
		}
	}
}