package cc.sitemaker.common.components.wizard
{
	import flash.events.Event;
	
	import mx.containers.Canvas;
	import mx.containers.ViewStack;
	import mx.controls.Button;
	import mx.controls.Image;
	import mx.controls.TabBar;
	import mx.core.ContainerCreationPolicy;
	import mx.core.EdgeMetrics;
	import mx.effects.Fade;
	
	import spark.components.Group;
	import spark.components.VGroup;
	
	
	[Event(name="wizardPrevious")]
	[Event(name="wizardNext")]
	[Event(name="wizardFinish")]
	[Bindable]
	public class Wizard extends VGroup
	{
		private static const HEADER_FOOTER_HEIGHT : Number = 50;
		public static const WIZARD_SCREEN_PREVIOUS : String = "wizardPrevious";
		public static const WIZARD_SCREEN_NEXT : String = "wizardNext";
		public static const WIZARD_SCREEN_FINISH : String = "wizardFinish";
		
		public var title : String = "";
		
		private var mvViewMetrics : EdgeMetrics;
		
		private var wizardStepper:Stepper;
		private var wizardBackAndNext : WizardBackAndNext;
		private var wizardViewStack : ViewStack;
		private var wizardLogo : Image;
		
		private var fadeEffect : Fade;
		
		private var movingNext : Boolean = false;
		
		[ArrayElementType("cc.sitemaker.common.components.wizard.BaseWizardPage")]
		public var pages : Array;
		
		public function Wizard()
		{
			super();
		}
		
		override protected function createChildren() : void
		{
			super.createChildren();
			
			createEffects();
			createWizardComponents();
		}
		
		private function createEffects() : void
		{
			if(fadeEffect == null)
			{
				fadeEffect = new Fade();
				fadeEffect.duration = 800;
			}
		}
		
		private function createWizardComponents() : void
		{
			if(wizardViewStack == null)
			{
				wizardViewStack = new ViewStack();
				wizardViewStack.percentWidth = 100;
				wizardViewStack.creationPolicy = ContainerCreationPolicy.ALL;
				
				for each(var wizardPage : BaseWizardPage in pages)
				{
					wizardViewStack.addChild(wizardPage);
					wizardPage.preInitialise(serverValidationResult, serverExecutionResult);
					wizardPage.initialisePage();
				}
				
				wizardViewStack.addEventListener(Event.CHANGE, viewIndexChanged);
			}
			
			if(wizardStepper == null){
				wizardStepper = new Stepper();
				wizardStepper.dataProvider = pages;
				wizardStepper.selectedIndex = 0;
				wizardStepper.percentWidth = 100;
				wizardStepper.addEventListener(WizardBackAndNext.MOVE_NEXT, moveNext_Click);
				wizardStepper.addEventListener(WizardBackAndNext.MOVE_PREVIOUS, movePrevious_Click);
			}
			
			if(wizardBackAndNext == null)
			{
				wizardBackAndNext = new WizardBackAndNext();
				wizardBackAndNext.pages = pages;
				wizardBackAndNext.percentWidth = 100;
				wizardBackAndNext.addEventListener(WizardBackAndNext.MOVE_NEXT, moveNext_Click);
				wizardBackAndNext.addEventListener(WizardBackAndNext.MOVE_PREVIOUS, movePrevious_Click);
			}
	
			addElement(wizardStepper);
			addElement(wizardViewStack);
			addElement(wizardBackAndNext);
		}
		
		private function moveNext_Click(event : Event) : void
		{
			moveNext();
		}
		
		private function movePrevious_Click(event : Event) : void
		{
			movePrevious();
		}
		
		private function viewIndexChanged(event : Event) : void
		{
			wizardStepper.selectedIndex = wizardViewStack.selectedIndex;
			
			fadeEffect.play([ wizardViewStack.selectedChild ]);
		}
		
		private function serverExecutionResult(result : Boolean, body : Object) : void
		{
			var currentPage : BaseWizardPage = wizardViewStack.selectedChild as BaseWizardPage;
			
			currentPage.handleServerExecutionResult(result, body);
			
			if(result)
			{
				movingNext = false;
				
				if(wizardViewStack.selectedIndex >= wizardViewStack.numChildren - 1)
				{
					// the user is on the last page of the wizard
					dispatchEvent(new Event(WIZARD_SCREEN_FINISH, true));
				}
				else
				{
					// move the user to the next page in the wizard
					wizardViewStack.selectedIndex++;
					wizardBackAndNext.selectedIndex++;
					
					var newPage : BaseWizardPage = wizardViewStack.selectedChild as BaseWizardPage;
					
					newPage.activatePage();
					
					dispatchEvent(new Event(WIZARD_SCREEN_NEXT, true));
				}
			}
		}
		
		private function serverValidationResult(result : Boolean) : void
		{
			var currentPage : BaseWizardPage = wizardViewStack.selectedChild as BaseWizardPage;
			
			currentPage.handleServerValidationResult(result);
			
			if(result && movingNext)
			{
				currentPage.serverExecute();
			}
		}
		
		private function finish() : void
		{
			var currentPage : BaseWizardPage = wizardViewStack.selectedChild as BaseWizardPage;
			
			if(currentPage.isValid())
			{
				movingNext = true;
				currentPage.serverValidate();
			}
		}
		
		private function moveNext() : void
		{
			// check there is a next page in the wizard
			if(wizardViewStack.selectedIndex == wizardViewStack.numChildren - 1)
			{
				finish();
			}
			else if(wizardViewStack.selectedIndex > wizardViewStack.numChildren - 1)
			{
				return;
			}
			
			var currentPage : BaseWizardPage = wizardViewStack.selectedChild as BaseWizardPage;
			
			if(currentPage.isValid())
			{
				movingNext = true;
				currentPage.serverValidate();
			}
		}
		
		private function movePrevious() : Boolean
		{
			if(wizardViewStack.selectedIndex <= 0)
				return false;
			
			wizardViewStack.selectedIndex--;
			wizardBackAndNext.selectedIndex--;
			
			dispatchEvent(new Event(WIZARD_SCREEN_PREVIOUS, true));
			
			return true;
		}
	}
}