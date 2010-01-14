package asx.events
{
  import flash.events.Event;
  import flash.events.IEventDispatcher;

  // possible alternative: component.addEventListener(Event.COMPLETE, listenOnce(listener));  
  /**
   * Observe an Event on a target one time only.
   * 
   * @example
   * <listing version="3.0">
   *  var component:UIComponent = new UIComponent();
   *  once(component, FlexEvent.CREATION_COMPLETE, function(event:Event):void {
   *    trace('created!');
   *  });
   * </listing>  
   */
  public function once(target:IEventDispatcher, type:String, listener:Function):IEventDispatcher {
    var onceListener:Function = function(event:Event):void {
      listener(event);
      target.removeEventListener(type, onceListener);
    };
    target.addEventListener(type, onceListener, false, 0, true);
    return target;
  }
}