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
			// Calls the native function helloWorld.
            return String(extContext.call("helloWorld"));
        }

    }

}