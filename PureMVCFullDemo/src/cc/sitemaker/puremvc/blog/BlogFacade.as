package cc.sitemaker.puremvc.blog
{
	import cc.sitemaker.puremvc.blog.controller.StartupCommand;
	
	import modules.Blog;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class BlogFacade extends Facade
	{
		
		public static const STARTUP:String = "startup";

		public function BlogFacade(key:String)
		{
			super(key);
		}
		
		/**
		 * ApplicationFacade Factory Method
		 */
		public static function getInstance( key:String ):BlogFacade
		{
			if ( instanceMap[ key ] == null )
				instanceMap[ key ]= new BlogFacade( key );
			
			return instanceMap[ key ] as BlogFacade;
		}
		
		/**
		 * Register Commands with the Controller
		 */
		override protected function initializeController( ) : void
		{
			super.initializeController();
			
		}
		
		/**
		 * Application startup
		 *
		 * @param app a reference to the application component
		 */
		public function startup( app:Blog ):void
		{
			registerCommand( STARTUP, StartupCommand);
			
			sendNotification( STARTUP, app );
		}

	}
}