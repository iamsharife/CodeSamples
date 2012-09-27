package cc.sitemaker.common.flow
{
	import flash.events.EventDispatcher;

	[DefaultProperty("transitions")]
	
	public class Action extends EventDispatcher implements IAction{
		
		public static const DEFAULT:String="default";
		
		public var actionId:String;
		
		[ArrayElementType("cc.sitemaker.common.flow.Transition")]
		public var transitions:Array;
		protected var _view:IStateView;
		
		public function Action(){
			actionId = DEFAULT;
		}
		
		public function perform(model:*, view:IStateView):void{
			_view = view;
			onResult(null);
		}
		
		protected function onResult(result:Object):void{
			var aE:ActionEvent = new ActionEvent(ActionEvent.COMPLETE);
			aE.outcome = ActionEvent.SUCCESS;
			dispatchEvent(aE);
		}
		
		protected function onFault(fault:Object):void{
			var aE:ActionEvent = new ActionEvent(ActionEvent.COMPLETE);
			aE.outcome = ActionEvent.FAILURE;
			dispatchEvent(aE);
		}
		
		public function getTransition(key:String):Transition{
			var transition:Transition;
			for (var i:int = 0; i < transitions.length; i++) {
				var tran:Transition = transitions[i] as Transition;
				if (tran.on == key){
					transition = tran;
					break;
				}
			}
			return transition;
		}
		
		protected function dispatchCompleteActionEvent(key:String):void{
			var aE:ActionEvent = new ActionEvent(ActionEvent.COMPLETE);
			aE.outcome = key;
			dispatchEvent(aE);
		}
	}
}