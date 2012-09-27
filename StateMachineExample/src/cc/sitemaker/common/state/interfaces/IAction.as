package cc.sitemaker.common.state.interfaces{

	public interface IAction extends IDispatcher {
		
		public function getKey():String;
		
		public function setModel(model:StateModel):void;
		
		public function setView(view:IStateView):void;
		
		public function getView():IStateView;
		
		public function perform():void;
		
		public function blockCursor():Boolean;	
		
	}
}