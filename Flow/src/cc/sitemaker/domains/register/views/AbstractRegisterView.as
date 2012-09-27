package cc.sitemaker.domains.register.views
{
	import cc.sitemaker.common.flow.IStateView;
	import cc.sitemaker.common.flow.StateView;
	import cc.sitemaker.domains.register.model.RegisterModel;
	
	public class AbstractRegisterView extends StateView implements IStateView
	{
		
		[Bindable]
		protected var _model:RegisterModel;
				
		public function set model(value:*):void
		{
			_model = value as RegisterModel;
		}
	}
}