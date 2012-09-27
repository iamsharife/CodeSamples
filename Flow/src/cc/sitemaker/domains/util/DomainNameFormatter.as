package cc.sitemaker.domains.util
{
	public class DomainNameFormatter
	{
		public static function Format(domainName:String):String{
			// Lower case all to make tests easier
			domainName = domainName.toLowerCase();
			
			// strip http://
			if (domainName.indexOf("http://") != -1){
				domainName = domainName.split("http://")[1];	
			}
			
			// strip www.
			if (domainName.indexOf("www.") != -1){
				domainName = domainName.split("www.")[1];	
			}
			
			return domainName;
		}
	}
}