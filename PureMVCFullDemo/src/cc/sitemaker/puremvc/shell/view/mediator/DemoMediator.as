package cc.sitemaker.puremvc.shell.view.mediator
{
	import cc.sitemaker.puremvc.common.ISMModule;
	import cc.sitemaker.puremvc.shell.events.SMModuleEvent;
	
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class DemoMediator extends Mediator
	{	
		public static const NAME:String = "application"
		public function DemoMediator( viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function get view():PureMVCFullDemo {
			return viewComponent as PureMVCFullDemo;
		}
		
		override public function onRegister():void{
			
			view.addEventListener( SMModuleEvent.LOAD_MODULE, onLoadModule);
			view.addEventListener( SMModuleEvent.UNLOAD_MODULE, onUnloadModule);
			
		}
		
		private function onLoadModule(e:SMModuleEvent):void{
			view.appLoader.unloadModule();
			view.appLoader.loadModule( e.moduleUrl );
		}
		
		private function onUnloadModule(e:SMModuleEvent):void{
			
			(view.appLoader.child as ISMModule).dispose();
			
			view.appLoader.url = null;
			view.appLoader.unloadModule();
		}
	}
}