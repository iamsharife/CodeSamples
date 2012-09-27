package flexUnitTests
{
	import cc.sitemaker.upload.manager.UploadManager;
	import cc.sitemaker.upload.model.UploadModel;
	import cc.sitemaker.upload.service.UploadService;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.FileReference;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertEquals;
	
	public class UploadManagerTest
	{		
		private var _eventDispatcher:IEventDispatcher;
		private var _uploadManager:UploadManager;
		
		private var _fileRef:FileReference;
		
		public function get fileRef():FileReference
		{
			return _fileRef;
		}

		public function set fileRef(value:FileReference):void
		{
			_fileRef = value;
		}

		[Before]
		public function setUp():void {
			_eventDispatcher = new EventDispatcher();
			_uploadManager = new UploadManager(_eventDispatcher);
		}
		
		[After]
		public function tearDown():void {
			_eventDispatcher = null;
			_uploadManager = null;
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void {
			
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void {
		}
		
		[Test]
		public function testUploadFileAddedToModel():void {
			
			_uploadManager.uploadFile(fileRef);
			assertEquals(_uploadManager.getModel().getUploadByFileReference(fileRef) != null);
			Assert.fail("Test method Not yet implemented");
		}
	}
}