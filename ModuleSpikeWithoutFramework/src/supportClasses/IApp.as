package supportClasses
{
	import mx.collections.ArrayList;
	
	import supportClasses.events.SMModuleEvent;
	import supportClasses.view.BaseModuleView;
	import supportClasses.view.ISMModuleView;

	public interface IApp {
		
		//function get views():ArrayList;
		
		function get currentView():ISMModuleView;
		
		function set viewCurrentState(state:String):void;
		
		function moduleChangeRequest(e:SMModuleEvent):void;
	}
}