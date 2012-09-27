package cc.sitemaker.common.state.views
{
	import cc.sitemaker.common.state.interfaces.IStateMachine;
	import cc.sitemaker.common.state.interfaces.IStateView;
	import cc.sitemaker.common.state.interfaces.IViewFactory;
	
	import mx.core.UIComponent;
	
	public class AbstractStateView extends UIComponent implements IStateView
	{
		private var stateMachine:IStateMachine;
		private var model:StateModel;	
		private var viewFactory:IViewFactory;
		
		public function setStateMachine(stateMachine:IStateMachine):void
		{
			stateMachine = stateMachine;
			
			if (model){
				model.removeListener(DataEvent.UPDATE,this);
			}
			
			model = stateMachine.getModel();
			model.addListener(DataEvent.UPDATE,this);
		}
		
		public function getStateMachine():IStateMachine
		{
			return m_stateMachine;
		}
		
		public function getActionValue(key:String):Object
		{
			if(this["m_"+key] instanceof IComponent){
				return this["m_"+key].getValue();
			}else{
				return null;
			}
		}
		
		public function setFactory(viewFactory:IViewFactory):void
		{
			viewFactory = viewFactory;
		}
		
		public function getFactory():IViewFactory
		{
			return null;
		}
		
		public function showBlockingCursor(void:*):void
		{
			// abstract...
		}
		
		public function hideBlockingCursor():void
		{
			// abstract...
		}
	}
}