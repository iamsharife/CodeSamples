package cc.sitemaker.common.state.interfaces
{
	public class IPageController
	{
		public function IPageController() {
			
			public function setPageLength (pageLength : Number):void;
			
			public function setListSize (listSize : Number):void;
			
			public function setCurrentPage (currentPage : Number):void;
			
			public function update(void):void;
			
		}
	}
}