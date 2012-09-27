package cc.sitemaker.puremvc.model
{
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	public class SiteServicesProxy extends Proxy
	{	
		public static const NAME:String = "serviceProxy";
		public function SiteServicesProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
		}
		
		public override function onRegister():void {
			trace (NAME + "has been register");
		}
	}
}