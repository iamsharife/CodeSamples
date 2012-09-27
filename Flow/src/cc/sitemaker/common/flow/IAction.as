package cc.sitemaker.common.flow
{
	public interface IAction {
		
		function perform(model:*, view:IStateView):void;
		
	}
}