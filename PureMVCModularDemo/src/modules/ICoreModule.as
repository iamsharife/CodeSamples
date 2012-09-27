package modules
{
	import mx.modules.IModule;
	
	public interface ICoreModule extends IModule
	{
		function set sharedProxies (value:Array):void
		function get sharedProxies ():Array;
		function  dispose ():void;
		
	}
}