package 
{
    import flash.events.EventDispatcher;
    import flash.external.ExtensionContext;


    public class HelloWorldExtension extends EventDispatcher {

        private var extContext:ExtensionContext;

        public function HelloWorldExtension() {
            extContext = ExtensionContext.createExtensionContext("HelloWorldExtension", null);
        }

        public function helloWorld() : String  {
			// Calls the native function helloWorld. Name must match the
			// name specified to the runtime during the extensionContext's
			// initialization, otherwise you will obviously get error #3500.
            return String(extContext.call("helloWorld"));
        }

    }

}