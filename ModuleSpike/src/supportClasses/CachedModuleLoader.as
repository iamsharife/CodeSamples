package supportClasses
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import mx.events.FlexEvent;
	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;
	import mx.modules.ModuleLoader;
	import mx.modules.ModuleManager;
	
	/**
	 * This class manages the loading, unloading and caching of Flex Modules
	 * This is a modified version of the mx.modules.ModuleLoader class
	 *
	 * @author Danny Kopping - danny@ria-coder.com
	 */
	public class CachedModuleLoader extends ModuleLoader
	{
		private var map:Dictionary = new Dictionary();
		
		private var _url:String = null;
		private var module:IModuleInfo;
		private var loadRequested:Boolean = false;
		
		public function CachedModuleLoader()
		{
			super();
		}
		
		override public function set url(value:String):void
		{
			if (value == _url)
				return;
			
			if (module)
			{
				module.removeEventListener(ModuleEvent.PROGRESS, moduleProgressHandler);
				module.removeEventListener(ModuleEvent.SETUP, moduleSetupHandler);
				module.removeEventListener(ModuleEvent.READY, moduleReadyHandler);
				module.removeEventListener(ModuleEvent.ERROR, moduleErrorHandler);
				module.removeEventListener(ModuleEvent.UNLOAD, moduleUnloadHandler);
				
				//module.release();
				module = null;
				
				if (child)
				{
					removeChild(child);
					//child = null;
				}
			}
			
			_url = value;
			
			dispatchEvent(new FlexEvent(FlexEvent.URL_CHANGED));
			removeAllChildren();
			
			if (_url != null && loadRequested)
			{
				if(!map[_url])
					loadModule();
				else
				{
					
					child = map[_url];
					addChild(child);
				}
			}
		}
		
		override public function get url():String
		{
			return _url;
		}
		
		override public function createComponentsFromDescriptors(recurse:Boolean = true):void
		{
			super.createComponentsFromDescriptors(recurse);
			
			loadRequested = true;
			loadModule();
		}
		
		override public function loadModule(url:String = null, bytes:ByteArray = null):void
		{
			if (url != null)
				_url = url;
			
			if (_url == null)
			{
				//trace("loadModule() - null url");
				return;
			}
			
			if (map[_url])
			{
				//trace("loadModule() - already created the child");
				return;
			}
			
			if (module)
			{
				//trace("loadModule() - load already initiated");
				return;
			}
			
			dispatchEvent(new FlexEvent(FlexEvent.LOADING));
			
			module = ModuleManager.getModule(_url);
			
			module.addEventListener(ModuleEvent.PROGRESS, moduleProgressHandler);
			module.addEventListener(ModuleEvent.SETUP, moduleSetupHandler);
			module.addEventListener(ModuleEvent.READY, moduleReadyHandler);
			module.addEventListener(ModuleEvent.ERROR, moduleErrorHandler);
			module.addEventListener(ModuleEvent.UNLOAD, moduleUnloadHandler);
			
			module.load(applicationDomain, null, bytes);
		}
		
		override public function unloadModule():void
		{
			if (child && contains(child))
			{
				removeChild(child);
				child = null;
			}
			
			if (module)
			{
				module.removeEventListener(ModuleEvent.PROGRESS, moduleProgressHandler);
				module.removeEventListener(ModuleEvent.SETUP, moduleSetupHandler);
				module.removeEventListener(ModuleEvent.READY, moduleReadyHandler);
				module.removeEventListener(ModuleEvent.ERROR, moduleErrorHandler);
				
				module.unload();
				module.removeEventListener(ModuleEvent.UNLOAD, moduleUnloadHandler);
				module = null;
			}
			
			if(map[_url])
			{
				delete map[_url];
			}
		}
		
		private function moduleProgressHandler(event:ModuleEvent):void
		{
			dispatchEvent(event);
		}
		
		private function moduleSetupHandler(event:ModuleEvent):void
		{
			// Not ready for creation yet, but can call factory.info().
			
			dispatchEvent(event);
		}
		
		private function moduleReadyHandler(event:ModuleEvent):void
		{
			child = module.factory.create() as DisplayObject;
			dispatchEvent(event);
			
			if (child)
			{
				var p:DisplayObjectContainer = parent;
				// p.removeChild(this);
				addChild(child);
				
				map[url] = child;//ModuleManager.getModule(_url);
				//trace(map + ":" + url + ":" + map[url]);
			}
		}
		
		private function moduleErrorHandler(event:ModuleEvent):void
		{
			unloadModule();
			dispatchEvent(event);
		}
		
		private function moduleUnloadHandler(event:ModuleEvent):void
		{
			dispatchEvent(event);
		}
	}
}