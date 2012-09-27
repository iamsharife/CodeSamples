package cc.sitemaker.common.model.user
{
	public class Subscription
	{
		public var daysLeft:Number;
		public var productName:String;
		public var productId:String;
		public var paidUp:Boolean;
		
		public function Subscription() :void{
			daysLeft = 0;
			productId = null;
			productName = null;
			paidUp = false;
		}
	}
}