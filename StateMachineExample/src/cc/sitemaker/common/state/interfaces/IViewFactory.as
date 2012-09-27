package cc.sitemaker.common.state.interfaces
{
	public interface IViewFactory {
		
		public function createView(parent:IUIContainer):IStateView;
		
	}
}