package cc.sitemaker.robotlegs.view.mediator
{
	import cc.sitemaker.robotlegs.view.components.WelcomeScreen;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class WelcomeScreenMediator extends Mediator
	{
		// By using the Inject tag, this dependancy is required for this class
		[Inject]public var welcomeScreen:WelcomeScreen;
		
		public function WelcomeScreenMediator()
		{
		}
		
		// onRegister, change is made the view to demonstrate 
		// the mapping of the mediator to the view.
		override public function onRegister():void{
			//welcomeScreen.title.text = "Changed the name!";
		}
	}
}