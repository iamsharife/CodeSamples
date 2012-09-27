package cc.sitemaker.robotlegs.common
{
	public class FSMModularDemo
	{
		/**
		 * XML configures the State Machine. This could be loaded from an external
		 * file as well.
		 */
		
		// State definitions 
		public static const MODULE_A_ALIVE:String='state / the module A is active';
		public static const MODULE_B_ALIVE:String='state / the module B is active';
		public static const MODULES_C_D_ALIVE:String='state / modules C and D are active';
		public static const APP_STARTING:String='state / app is not ready, still starting';
		public static const APP_READY:String='state / Application is ready';
		// Actions triggers
		public static const APP_LOAD_COMPLETED:String ='action / application initialization completed';
		public static const LOAD_MODULE_A:String ='action / Load Module A';
		public static const LOAD_MODULE_B:String ='action / Load Module B';
		public static const UNLOAD_MODULE:String ='action / Unload any module';
		
		//Changed - Entering - Exiting 
		public static const APP_READY_CHANGED:String ='state App Ready is changed';
		public static const MODULE_A_ENTERING:String ='Entering Module A';
		
		public static const FSM:XML=
			<fsm initial={APP_STARTING}>
	
				<state name={APP_STARTING}>
					<transition action={APP_LOAD_COMPLETED} target={APP_READY}/>
				</state>
				
				<state name={APP_READY} changed={APP_READY_CHANGED}>
					<transition action={LOAD_MODULE_A} target={MODULE_A_ALIVE}/>	
					<transition action={LOAD_MODULE_B} target={MODULE_B_ALIVE}/>	
				</state>
				
				<state name={MODULE_A_ALIVE} entering={MODULE_A_ENTERING} >
					<transition action={UNLOAD_MODULE} target={APP_READY}/>	
				</state>

				<state name={MODULE_B_ALIVE}>
					<transition action={UNLOAD_MODULE} target={APP_READY}/>		
				</state>
		
				<state name={MODULES_C_D_ALIVE}>
					<transition action={UNLOAD_MODULE} target={APP_READY}/>	
				</state>


			</fsm>;
	}
}