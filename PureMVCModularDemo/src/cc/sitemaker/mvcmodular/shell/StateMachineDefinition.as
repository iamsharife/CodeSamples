package cc.sitemaker.mvcmodular.shell
{

	public class StateMachineDefinition
	{
		/**
		 * XML configures the State Machine. This could be loaded from an external
		 * file as well.
		 */
		
		// State definitions 
		public static const POST_TAGS_MODULE_LOADED:String='state / the module posttags is active';
		public static const GLOBAL_TAGS_MODULE_LOADED:String='state / the module global tags is active';
		public static const APP_STARTING:String='state / app is not ready, still starting';
		public static const APP_READY:String='state / Application is ready';
		public static const NON_MODULAR_MODULE:String='state / non modular module loader';
		// Actions triggers
		public static const APP_LOAD_COMPLETED:String ='action / application initialization completed';
		public static const LOAD_POST_TAGS_MODULE:String ='action / Load Module A';
		public static const LOAD_GLOBAL_TAGS_MODULE:String ='action / Load Module B';
		public static const UNLOAD_MODULE:String ='action / Unload any module';
		public static const LOAD_NON_MODULAR:String ='action / load non modular module';
		
		//Changed - Entering - Exiting 
		public static const APP_READY_CHANGED:String ='state App Ready is changed';
		public static const POST_TAGS_ENTERING:String ='Entering postTags module';
		public static const GLOBAL_TAGS_ENTERING:String ='Entering global Tags module';
		public static const NON_MODULAR_ENTERING:String ='Entering non modular module';
		
		public static const FSM:XML=
			<fsm initial={APP_STARTING}>
	
				<state name={APP_STARTING}>
					<transition action={APP_LOAD_COMPLETED} target={APP_READY}/>
				</state>
				
				<state name={APP_READY} changed={APP_READY_CHANGED}>
					<transition action={LOAD_POST_TAGS_MODULE} target={POST_TAGS_MODULE_LOADED}/>	
					<transition action={LOAD_GLOBAL_TAGS_MODULE} target={GLOBAL_TAGS_MODULE_LOADED}/>	
					<transition action={LOAD_NON_MODULAR} target={NON_MODULAR_MODULE}/>	
					<transition action={APP_LOAD_COMPLETED} target={APP_READY}/>
				</state>
				
				<state name={POST_TAGS_MODULE_LOADED} entering={POST_TAGS_ENTERING} >
					<transition action={UNLOAD_MODULE} target={APP_READY}/>	
					<transition action={LOAD_GLOBAL_TAGS_MODULE} target={GLOBAL_TAGS_MODULE_LOADED}/>
					<transition action={LOAD_NON_MODULAR} target={NON_MODULAR_MODULE}/>	
					<transition action={APP_LOAD_COMPLETED} target={APP_READY}/>
				</state>

				<state name={GLOBAL_TAGS_MODULE_LOADED} entering={GLOBAL_TAGS_ENTERING} >
					<transition action={LOAD_POST_TAGS_MODULE} target={POST_TAGS_MODULE_LOADED}/>	
					<transition action={UNLOAD_MODULE} target={APP_READY}/>
					<transition action={LOAD_NON_MODULAR} target={NON_MODULAR_MODULE}/>
					<transition action={APP_LOAD_COMPLETED} target={APP_READY}/>
				</state>
				<state name={NON_MODULAR_MODULE} entering={NON_MODULAR_ENTERING} >
					<transition action={LOAD_POST_TAGS_MODULE} target={POST_TAGS_MODULE_LOADED}/>	
					<transition action={LOAD_GLOBAL_TAGS_MODULE} target={GLOBAL_TAGS_MODULE_LOADED}/>		
					<transition action={LOAD_NON_MODULAR} target={NON_MODULAR_MODULE}/>
					<transition action={APP_LOAD_COMPLETED} target={APP_READY}/>
				</state>

			</fsm>;

	}
}