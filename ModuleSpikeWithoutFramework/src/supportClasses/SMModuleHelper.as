package supportClasses
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.events.FlexEvent;
	
	import supportClasses.events.SMModuleEvent;
	import supportClasses.view.BaseModuleView;
	import supportClasses.view.ModuleMainView;
	
	public class SMModuleHelper extends EventDispatcher
	{
		private var _target:IEventDispatcher;
		
		public function SMModuleHelper(target:IEventDispatcher=null)
		{
			super(target);
			
			_target = target;
			
			target.addEventListener(SMModuleEvent.VIEW_CHANGING, onViewChanging);
			target.addEventListener(SMModuleEvent.VIEW_CHANGE, onViewChange);
			target.addEventListener(SMModuleEvent.VIEW_CANCEL_CHANGE, onViewCancelChange);
			target.addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		private function onCreationComplete(e:FlexEvent):void{
			var smme:SMModuleEvent = new SMModuleEvent(SMModuleEvent.MODULE_CREATION_COMPLETE);
			getModule().dispatchEvent(smme);
		}
		
		
		private function getModule():SMModule{
			return _target as SMModule;
		}
		
		private function logIt(message:String, target:String):void{
			trace("SMModuleHelper::logIt","::Target = " + target,"::Message = " + message);
		}
		
		private function onViewChanging(e:SMModuleEvent):void{
			var main:ModuleMainView = getModule().getMain();
			var view:BaseModuleView = (main.numElements > 0) ? main.getElementAt(0) as BaseModuleView : null;
			
			if (view != null){
				view.viewChangeRequested(e.newState, e.newModule);
			} else {					
				var smme:SMModuleEvent = new SMModuleEvent(SMModuleEvent.VIEW_CHANGE);
				smme.newState = e.newState;
				smme.newModule = e.newModule;
				getModule().dispatchEvent(smme);
			}
		} 
		
		private function onViewChange(e:SMModuleEvent):void{
			trace("SMModuleHelper::onViewChange","::e.target = ", e.target);
			trace("SMModuleHelper::onViewChange","::ViewRequest = ", e.newState, "::Module Requested = ", e.newModule);
			
			if (e.oldModule != e.newModule){
				// exit of module requested
				var smme:SMModuleEvent = new SMModuleEvent(SMModuleEvent.EXIT_MODULE);
				smme.newState = e.newState;
				smme.newModule = e.newModule;
				getModule().dispatchEvent(smme);
			} else {
				getModule().getMain().currentState = e.newState;
				getModule().updateMenuSelection(e.newState);
			}
		} 
		
		private function onViewCancelChange(e:SMModuleEvent):void{
			getModule().updateMenuSelection(getModule().getMain().currentState);
		}
	}
}