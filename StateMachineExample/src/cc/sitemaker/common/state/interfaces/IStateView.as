package cc.sitemaker.common.state.interfaces
{
	public interface IStateView {
		
		public function setStateMachine(stateMachine:IStateMachine):void;
		
		public function getStateMachine():IStateMachine;
		
		public function getActionValue(key:String):Object;
		
		public function setFactory(viewFactory:IViewFactory):void;
		
		public function getFactory():IViewFactory;
		
		public function showBlockingCursor(void):void;
		
		public function hideBlockingCursor(void):void;
		
	}
}