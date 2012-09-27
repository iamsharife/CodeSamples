package cc.sitemaker.robotlegs.siteServices.view.mediator
{
	import cc.sitemaker.robotlegs.common.model.DataModel;
	import cc.sitemaker.robotlegs.siteServices.view.components.SiteServicesMain;
	
	import org.robotlegs.mvcs.Mediator;

	public class SiteServicesMainMediator extends Mediator
	{
		[Inject]public var siteServicesMain:SiteServicesMain;
		
		[Inject]public var model:DataModel;
		
		public function SiteServicesMainMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			siteServicesMain.lbl.text = "SiteServicesMain " + model.data.toString();
		}
	}
}