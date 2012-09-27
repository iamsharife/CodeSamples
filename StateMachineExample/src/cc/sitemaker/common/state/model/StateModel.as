package cc.sitemaker.common.state.model
{
	import mx.collections.ArrayList;

	public class StateModel {
		public function StateModel() 	{
			
			private var t_errorList : ArrayList;
			
			public function setErrorList(errorList:ArrayList):void {
				t_errorList = errorList;
			}
			
			public function getErrorList(void):ArrayList{
				return t_errorList.clone();
			}	
		}
	}
}