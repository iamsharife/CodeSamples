package cc.sitemaker.swiz.common.services
{
	import mx.rpc.AsyncToken;
	
	import org.swizframework.utils.services.MockDelegateHelper;

	/* Implements ITagDelegate, this contains all the methods 
	 * that may be called on a tag service. 
	 * This allows the interface to be used by both a real service resolver 
	 * and a mock service resolver
	*/
	public class MockTagResolver implements ITagDelegate
	{		
		[Inject]
		public var mdh:MockDelegateHelper;
		
		public function MockTagResolver()
		{
		}
		
		public function getTags():AsyncToken
		{			
			return mdh.createMockResult( getFakeTags(), 1500 );					
		}
		
		// Used to generate fake data
		private function getFakeTags():Array{
			
			var obj1:Object = {name : "Computer"}
			var obj2:Object = {name : "AS3"}
			var obj3:Object = {name : "Flex"}
			var obj4:Object = {name : "Robotlegs"}
			
			return  [obj1,obj2,obj3,obj4]	
		}
	}
}