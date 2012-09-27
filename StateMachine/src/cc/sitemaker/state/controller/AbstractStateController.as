package cc.sitemaker.state.controller
{	
	import cc.sitemaker.state.states.State;
	
	import flash.events.EventDispatcher;
	
	import mx.core.IUIComponent;
	import mx.core.IVisualElement;
	import mx.core.UIComponent;

	[DefaultProperty("statelist")]
	public class AbstractStateController {
		
		private var _statelist:Array;
				
		public function AbstractStateController(){
			
		}

		public function get statelist():Array
		{
			return _statelist;
		}

		public function set statelist(value:Array):void
		{
			_statelist = value;
			
			for (var i:int = 0; i < value.length; i++) {
				var state:State = value[i] as State;
				state.stateMachine = this;
			}
		}

	}
}