package supportClasses
{
	import mx.collections.ArrayList;
	
	import supportClasses.view.BaseView;
	import supportClasses.view.ISMModuleView;

	public interface IApp {
		
		function get views():ArrayList;
		
		function get currentView():ISMModuleView;
		
		function moduleChangeRequest(newModule:String):void;
	}
}