package cc.sitemaker.swiz.model.presentation
{
	import cc.sitemaker.swiz.common.ISMModule;

	public class ModuleLoaderPresentationModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		public var currentModule:ISMModule;
		
		public function ModuleLoaderPresentationModel()
		{
			
		}
	}
}