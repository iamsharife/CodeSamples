package cc.sitemaker.common.state.actions
{
	import cc.sitemaker.common.state.interfaces.IAction;
	import cc.sitemaker.common.state.interfaces.IListener;
	import cc.sitemaker.common.state.interfaces.IStateView;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Action extends EventDispatcher implements IAction
	{
		private var model:StateModel;
		private var view:IStateView;
		private var key:String;
		private var log:ILog;
		private var blockCursor:Boolean;
		
		public function Action(key:String){
			key=key;
			view=null;
			blockCursor = true;
		}
		
		public function getKey()	{
			return key;
		}
		
		public function setModel(model:StateModel):void
		{
			model=model;
		}
		
		public function setView(view:IStateView):void
		{
			view=view;
		}
		
		public function getView():void
		{
			return view;
		}
		
		public function perform():void
		{
			dispatchEvent(new ActionEvent(this,ActionEvent.SUCCESS,null));			
		}
		
	}
}