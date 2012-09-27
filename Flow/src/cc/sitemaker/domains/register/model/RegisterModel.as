package cc.sitemaker.domains.register.model
{
	import mx.collections.ArrayList;

	[Bindable]
	public class RegisterModel
	{
	
		// Register domain data
		// domains and extensions chosen by
		private var desiredDomains:ArrayList;		
		private var desiredExtensions:ArrayList;  
		// user on stage one of Buy module
		private var unavailableDomains:ArrayList;	
		private var invalidDomains:ArrayList;
		// List of full domains ready to be searched for availability
		private var searchList:ArrayList;			
		
		private var searchResults:Array;
		private var availableDomains:ArrayList;
		private var products:ArrayList;
		private var orderItems:ArrayList;
		private var voucherPrices:ArrayList;
		
		//private var accountBalance:Price;	
		// amount of cash balance left on user's account in all supported currencies
		//private var user:SiteMakerUser;
		private var voucherOptIn:Boolean;
		//private var renewableDomain:DomainItem;
		private var renewDomain:Boolean;
		private var renewalPrices:ArrayList;
		private var domainsToBeOrdered:Array;
		
		public function RegisterModel()
		{
		}
	}
}