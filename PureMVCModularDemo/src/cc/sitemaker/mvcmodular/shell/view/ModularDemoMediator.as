package cc.sitemaker.mvcmodular.shell.view
{
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class ModularDemoMediator extends Mediator
	{	
		public static const NAME:String = "PureMVCModularDemo Mediator";
		public function ModularDemoMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function get view (): PureMVCModularDemo {
			return viewComponent as PureMVCModularDemo
		}
	}
}