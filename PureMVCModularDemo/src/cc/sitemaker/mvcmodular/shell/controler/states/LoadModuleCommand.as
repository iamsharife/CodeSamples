package cc.sitemaker.mvcmodular.shell.controler.states
{
	import cc.sitemaker.mvcmodular.shell.CacheModuleLoader;
	import cc.sitemaker.mvcmodular.shell.model.GlobalTagsProxy;
	import cc.sitemaker.mvcmodular.shell.model.PostTagsProxy;
	import cc.sitemaker.mvcmodular.shell.view.ModularDemoMediator;
	
	import flash.system.ApplicationDomain;
	import flash.system.System;
	
	import modules.GlobalTags;
	import modules.ICoreModule;
	
	import mx.events.ModuleEvent;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class LoadModuleCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			
			var rootMediator :ModularDemoMediator =  ModularDemoMediator (facade.retrieveMediator(ModularDemoMediator.NAME));
			var modulLoader :CacheModuleLoader = rootMediator.view.appLoader; 
			trace("LoadModuleCommand::ModuleUrl:",modulLoader.url,"state.data.module:", notification.getBody().toString());
			
			if (modulLoader.url ==  notification.getBody().module)
				
				
				if (modulLoader.url && modulLoader.url !=  notification.getBody().module ){
					trace("LoadModuleCommand::DifferentModule");
					//IModule (modulLoader.child).dispose();
					
					modulLoader.unloadModule();
					modulLoader.url = null;
					modulLoader.applicationDomain = null;
					System.gc();
				}
			
			var childDomain:ApplicationDomain = 
				new ApplicationDomain(ApplicationDomain.currentDomain);
			
			modulLoader.applicationDomain = childDomain;
			
			modulLoader.url = notification.getBody().module;
			modulLoader.addEventListener(ModuleEvent.READY, onModuleReady);
			modulLoader.loadModule ();
		}
		
		private function onModuleReady (e:ModuleEvent):void{
			var rootMediator :ModularDemoMediator =  ModularDemoMediator (facade.retrieveMediator(ModularDemoMediator.NAME));
			var modulLoader :CacheModuleLoader = rootMediator.view.appLoader; 
			modulLoader.removeEventListener(ModuleEvent.READY, onModuleReady);
			
			ICoreModule(modulLoader.child).sharedProxies = new Array(facade.retrieveProxy(GlobalTagsProxy.NAME),facade.retrieveProxy(PostTagsProxy.NAME));
		}
	}
}