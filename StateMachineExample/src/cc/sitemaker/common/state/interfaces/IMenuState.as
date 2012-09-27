package cc.sitemaker.common.state.interfaces
{
	public interface IMenuState extends IState	{
		
		public function getMenuKey(void):String;
		public function getTitle(void):String;
	}
}