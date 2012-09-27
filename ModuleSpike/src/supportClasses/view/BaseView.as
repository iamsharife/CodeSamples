package supportClasses.view
{
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.layouts.VerticalLayout;
	
	import supportClasses.events.SMModuleEvent;
	import supportClasses.model.ViewVO;
	
	public class BaseView extends Group implements ISMModuleView {
		
		public var viewRequested:String;
		public var moduleRequested:String;
				
		public function BaseView() {
			super();			
			percentWidth = 100;
			
			// temporarily setting layout for convenience of in-development
			layout = new VerticalLayout();
		}
							
		public function viewChangeRequested(intendedState:String, newModule:String = null):void{
			// is called if user has unsaved data on view and 
			// the viewVO is used to continue to the view previously requested
			var smme:SMModuleEvent = new SMModuleEvent(SMModuleEvent.VIEW_CHANGE);
			smme.newState = intendedState;
			smme.newModule = newModule;
			dispatchEvent(smme);
		}
		
		public function preventViewChange():void{
			var smme:SMModuleEvent = new SMModuleEvent(SMModuleEvent.VIEW_CANCEL_CHANGE);
			dispatchEvent(smme);
		}
		
	}
}