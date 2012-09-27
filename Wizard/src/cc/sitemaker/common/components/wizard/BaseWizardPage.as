package cc.sitemaker.common.components.wizard
{
	import mx.containers.VBox;
	
	import spark.components.NavigatorContent;
	import spark.components.VGroup;
	
	[Bindable]
	public class BaseWizardPage extends NavigatorContent
	{
		public var title : String = "";
		
		private var serverValidateCallback : Function;
		private var serverExecuteCallback : Function;
		private var isInitialised : Boolean = false;
				
		public function BaseWizardPage()
		{
		}
		
		/**
		 * Client Validation Check
		 * This lifecycle method is called when client validation is required.
		 */
		public function isValid() : Boolean
		{
			return true;
		}
		
		/**
		 * Server Validation Check
		 * This lifecycle method is called when server validation is required. A reference to the validation callback is supplied,
		 * which must be called, supplying a single Boolean parameter to indicate whether server validation succeeded.
		 */
		public function serverValidate() : void
		{
			sendServerValidationResult(true);
		}
		
		public function sendServerValidationResult(result : Boolean) : void
		{
			if(serverValidateCallback != null)
			{
				serverValidateCallback(result);
			}
		}
		
		public function handleServerValidationResult(result : Boolean) : void
		{
		}
		
		public function serverExecute() : void
		{
			sendServerExecutionResult(true, null);
		}
		
		public function sendServerExecutionResult(result : Boolean, body : Object) : void
		{
			if(serverExecuteCallback != null)
			{
				serverExecuteCallback(result, body);
			}
		}
		
		public function handleServerExecutionResult(result : Boolean, body : Object) : void
		{
		}
		
		/**
		 * Pre-initialisation steps required to setup the page. This method is marked final, so it may not be overridden.
		 * This lifecycle method is automatically called every time the page is loaded into the wizard.
		 */
		public final function preInitialise(serverValidateCallback : Function, serverExecuteCallback : Function) : void
		{
			if(!isInitialised)
			{
				this.serverValidateCallback = serverValidateCallback;
				this.serverExecuteCallback = serverExecuteCallback;
			}
		}
		
		/**
		 * Initialisation method to be overridden by each page (if required) for all initialisation steps.
		 * This lifecycle method is automatically called every time the page is loaded into the master page.
		 */
		public function initialisePage() : void
		{
		}
		
		/**
		 * Initialisation method to be overridden by each page (if required) for visual activation.
		 * This lifecycle method is automatically called every time the page is visually displayed in the wizard.
		 */
		public function activatePage() : void
		{
		}
		
		/**
		 * Destroy method to be overridden by each page (if required) for all destruction steps.
		 * This lifecycle method is automatically called every time the page is removed from the wizard.
		 */
		public function destroyPage() : void
		{
		}
		
		public final function postDestroy() : void
		{
		}
	}
}