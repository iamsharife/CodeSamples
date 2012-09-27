package cc.sitemaker.common.flow
{
	import spark.components.Group;
	
	public class StateView extends Group{
		
		[Bindable]
		public var stateProperties:Vector.<StateProperty>;
		
		public function StateView()	{
			super();
		}
		
		protected function performAction(key:String):void{
			var aE:ActionEvent = new ActionEvent(ActionEvent.PERFORM);
			aE.actionId = key;
			dispatchEvent(aE);
		}
	}
}