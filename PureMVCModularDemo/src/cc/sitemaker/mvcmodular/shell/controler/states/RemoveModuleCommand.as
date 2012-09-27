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
	
	public class RemoveModuleCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			
			var rootMediator :ModularDemoMediator =  ModularDemoMediator (facade.retrieveMediator(ModularDemoMediator.NAME));
			var modulLoader :CacheModuleLoader = rootMediator.view.appLoader; 
			
			
			if (modulLoader.url && modulLoader.child){
				
				if (modulLoader.child is ICoreModule){
					ICoreModule (modulLoader.child).dispose();}
			}
				
			modulLoader.addEventListener(ModuleEvent.UNLOAD, onUnLoadDone)
			modulLoader.unloadModule();
			modulLoader.url = null;
			modulLoader.applicationDomain = null;
				
		}

		private function onUnLoadDone(event:ModuleEvent):void
		{
			var rootMediator :ModularDemoMediator =  ModularDemoMediator (facade.retrieveMediator(ModularDemoMediator.NAME));
			var modulLoader :CacheModuleLoader = rootMediator.view.appLoader; 
			modulLoader.removeEventListener(ModuleEvent.UNLOAD, onUnLoadDone)
			System.gc();
		}
		
			
	}
}