package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import HelloWorldExtension;
	
	
	public class Main extends Sprite 
	{
		private var helloExt:HelloWorldExtension = new HelloWorldExtension();
		
		public function Main() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// Program start
			printHello();
		}
		
		/**
		 * Calls the Extension's AS3 helloWorld function.
		 */
		public function printHello() : void {
			trace(helloExt.helloWorld());
		}
		
	}
	
}