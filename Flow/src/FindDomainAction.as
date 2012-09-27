package
{
	import cc.sitemaker.common.flow.Action;
	import cc.sitemaker.common.flow.IStateView;
	import cc.sitemaker.common.flow.State;
	import cc.sitemaker.common.flow.StateProperties;
	import cc.sitemaker.common.flow.StateProperty;
	
	public class FindDomainAction extends Action
	{
		public function FindDomainAction()	{
			super();
		}
		
		override public function perform(view:IStateView):void{
			var domain:StateProperty = view.getStateProperties().getProperty("domain");
			if (domain.getValue() == ""){
				domain.error = "You must enter a domain";
			}
			else{
				domain.error = "";
				if (domain.getValue() == "moonfruit.com"){
					dispatchCompleteActionEvent("domainTaken");
				}
				else{
					dispatchCompleteActionEvent("domainAvailable");
				}
			}
			
		}
	}
}