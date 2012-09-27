package supportClasses
{
	import flashx.textLayout.events.ModelChange;
	
	import mx.collections.ArrayList;
	import mx.controls.Spacer;
	import mx.core.UIComponent;
	import mx.modules.Module;
	import mx.states.State;
	
	import spark.components.ButtonBar;
	import spark.components.Group;
	import spark.components.VGroup;
	import spark.events.IndexChangeEvent;
	
	import supportClasses.components.SMModuleMenu;
	import supportClasses.events.SMModuleEvent;
	import supportClasses.model.ModuleViewVO;
	import supportClasses.view.BaseModuleView;
	import supportClasses.view.ISMModuleView;
	import supportClasses.view.ModuleMainView;
	
	public class SMModule extends Module implements IApp {
		
		// Helper class
		private var helper:SMModuleHelper;
		
		// UI
		private var moduleTopBar:Group;
		private var moduleMenu:SMModuleMenu;		
		private var spacer:Spacer;
		
		public var views:ArrayList=new ArrayList();
				
		public function SMModule() {
			super();
			
			layout = "vertical";
			setStyle("paddingTop", 3);
			setStyle("horizontalAlign", "center");
			
			percentWidth = 100;
			percentHeight = 100;
			
			helper = new SMModuleHelper(this);
		}
		
		override protected function createChildren():void{
					
			if (!moduleTopBar){
				moduleTopBar = new Group();
				moduleTopBar.percentWidth = 100;
				moduleTopBar.minHeight = 30;
				addElement(moduleTopBar);
			}
			
			if (!moduleMenu){
				moduleMenu = new SMModuleMenu();
				moduleMenu.addEventListener(IndexChangeEvent.CHANGE, onMenuChange);
				moduleMenu.horizontalCenter = 0;
				moduleMenu.dataProvider = views;
				moduleTopBar.addElement(moduleMenu);
			}
			
			if (!spacer){
				spacer = new Spacer();
				spacer.height = 5;
				addElement(spacer);
			}
			
			super.createChildren();
		}
				
		public function get currentView():ISMModuleView{
			return (getMain() != null && getMain().numElements > 0)? getMain().getElementAt(0) as ISMModuleView : null; //getViewFromCurrentState();
		}
		
		public function set viewCurrentState(state:String):void{
			var viewStates:Array;
			
			if (getMain()){
				viewStates = getMain().states;
				
				for (var i:int = 0; i < viewStates.length; i++) 
				{
					var mxState:State = viewStates[i] as State;
					if (mxState.name == state){
						getMain().currentState = state;
						updateMenuSelection(state);
						break;
					}
				}
			} 
			
			return;			
		}
		
		public function getMain():ModuleMainView{
			return null;
		}
				
		protected function enableAllMenuButtons(exceptIndex:int):void{				
			for (var i:int = 0; i < moduleMenu.dataGroup.numElements; i++) {
				var element:UIComponent = moduleMenu.dataGroup.getElementAt(i) as UIComponent;
				if (element){
					if (i != exceptIndex){
						element.enabled = true;
					}
					else { 
						element.enabled = false;
					}
				}					
			}
		}
		
		public function updateMenuSelection(view:String):void{
			trace("SMModule::updateMenuSelection start", view)
			var selectedIndex:int=-1;
			
			for (var i:int = 0; i < views.length; i++){
				var t:ModuleViewVO = views.getItemAt(i) as ModuleViewVO;
				if (t.view == view){
					selectedIndex = i;
					break;
				}				
			}
			trace("SMModule::updateMenuSelection end", selectedIndex)
			moduleMenu.selectedIndex = selectedIndex;
			enableAllMenuButtons(selectedIndex);
		}
				
		protected function onMenuChange(e:IndexChangeEvent):void{
			// override 
			trace("SMModule::onMenuChange","::Old Index = " + e.oldIndex,"::New Index = " + e.newIndex);
			// dispatches change view to actually make the change to the view
			updateMenuSelection("");
			var smme:SMModuleEvent = new SMModuleEvent(SMModuleEvent.VIEW_CHANGING);
			smme.newState = (views.getItemAt(e.newIndex) as ModuleViewVO).view;
			dispatchEvent(smme);
		}
		
		public function moduleChangeRequest(e:SMModuleEvent):void{			
			var smme:SMModuleEvent = new SMModuleEvent(SMModuleEvent.VIEW_CHANGING);
			smme.oldState = e.oldState;
			smme.newState = e.newState;
			smme.newModule = e.newModule;
			dispatchEvent(smme);
		}
				
	}
}