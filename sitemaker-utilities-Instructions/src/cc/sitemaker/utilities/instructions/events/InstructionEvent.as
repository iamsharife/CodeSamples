package cc.sitemaker.utilities.instructions.events
{
	import cc.sitemaker.utilities.instructions.model.vo.Instruction;
	
	import flash.events.Event;
	
	public class InstructionEvent extends Event {
		
		public static const INSTRUCT_TARGET:String = "cc.sitemaker.utilities.instructions.events.InstructionEvent INSTRUCT_TARGET";
		public static const INSTRUCT_SOURCE:String = "cc.sitemaker.utilities.instructions.events.InstructionEvent INSTRUCT_SOURCE";
			
		public var instruction:Instruction;
		
		public function InstructionEvent(type:String=INSTRUCT_TARGET, bubbles:Boolean=true, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{		
			var mie:InstructionEvent = new InstructionEvent(type,bubbles,cancelable);
			mie.instruction = instruction;
			return mie;
		}
		
		override public function toString():String{
			return super.toString() + instruction.toString();
		}
		
	}
}