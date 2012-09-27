package cc.sitemaker.social.view.components.supportClasses
{
	import flash.events.Event;
	
	import mx.core.ContainerCreationPolicy;
	import mx.core.IDeferredContentOwner;
	import mx.core.INavigatorContent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	
	import spark.components.BorderContainer;
	import spark.layouts.VerticalLayout;
	
	[Event(name="socialServiceSelected", type="flash.events.Event")]
	
	public class SocialNavigatorContent extends BorderContainer implements INavigatorContent {
		
		private var _selected:Boolean;

		public function SocialNavigatorContent(){
			super();
			
			var vLayout:VerticalLayout = new VerticalLayout();
			vLayout.paddingTop = 10;
			vLayout.paddingBottom = 10;
			vLayout.paddingLeft = 10;
			vLayout.paddingRight = 10;
			
			layout = vLayout;
			
			percentWidth = 100;
			percentHeight = 100;
			
			//this.setStyle("skinClass", Class(DefaultWhiteRectangle));
			this.borderStroke = new SolidColorStroke(0xB3B3B3);
			this.backgroundFill = new SolidColor(0xFFFFFF);
		}
		
		
		[Bindable]
		public function get selected():Boolean {
			return _selected;
		}

		public function set selected(value:Boolean):void {
			_selected = value;
			
			dispatchEvent(new Event("socialServiceSelected"));
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Properties 
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  icon
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the icon property.
		 */
		private var _icon:Class = null;
		
		[Bindable("iconChanged")]
		[Inspectable(category="General", defaultValue="", format="EmbeddedFile")]
		
		/**
		 *  The Class of the icon displayed by some navigator
		 *  containers to represent this Container.
		 *
		 *  <p>For example, if this Container is a child of a TabNavigator,
		 *  this icon appears in the corresponding tab.
		 *  If this Container is a child of an Accordion,
		 *  this icon appears in the corresponding header.</p>
		 *
		 *  <p>To embed the icon in the SWF file, use the &#64;Embed()
		 *  MXML compiler directive:</p>
		 *
		 *  <pre>
		 *    icon="&#64;Embed('filepath')"
		 *  </pre>
		 *
		 *  <p>The image can be a JPEG, GIF, PNG, SVG, or SWF file.</p>
		 *
		 *  @default null
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public function get icon():Class
		{
			return _icon;
		}
		
		/**
		 *  @private
		 */
		public function set icon(value:Class):void
		{
			_icon = value;
			
			dispatchEvent(new Event("iconChanged"));
		}
		
		//----------------------------------
		//  label
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the label property.
		 */
		private var _label:String = "";
		
		[Bindable("labelChanged")]
		[Inspectable(category="General", defaultValue="")]
		
		/**
		 *  The text displayed by some navigator containers to represent
		 *  this Container.
		 *
		 *  <p>For example, if this Container is a child of a TabNavigator,
		 *  this string appears in the corresponding tab.
		 *  If this Container is a child of an Accordion,
		 *  this string appears in the corresponding header.</p>
		 *
		 *  @default ""
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public function get label():String
		{
			return _label;
		}
		
		/**
		 *  @private
		 */
		public function set label(value:String):void
		{
			_label = value;
			
			dispatchEvent(new Event("labelChanged"));
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Overridden Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 *  Create components that are children of this Container.
		 */
		override protected function createChildren():void
		{
			// if nobody has overridden creationPolicy, get it from the
			// navigator parent
			if (creationPolicy == ContainerCreationPolicy.AUTO)
			{
				if (parent is IDeferredContentOwner)
				{
					var parentCreationPolicy:String = IDeferredContentOwner(parent).creationPolicy;
					creationPolicy = parentCreationPolicy == 
						ContainerCreationPolicy.ALL ? ContainerCreationPolicy.ALL : 
						ContainerCreationPolicy.NONE;
					
				}
			}
			
			super.createChildren();
		}

	}
}