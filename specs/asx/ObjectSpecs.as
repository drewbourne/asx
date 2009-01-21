package asx { 
  
  import asx.fn.partial;
  import asx.object.*;
  import flash.events.Event;
  import org.hamcrest.*;
  import spectacular.dsl.*;
  
  public function ObjectSpecs():void {
    
    describe('asx.object', function():void {
      describe('merge(a:Object, b:Object):Object', function():void {
        it('copies enumerable read-write fields from b to a', function():void {
          // use anonymous objects
          var a:Object = { a: true };
          var b:Object = { b: true, c: 3 };
          
          merge(a, b);
          
          assertThat(a.a, true);
          assertThat(a.b, true);
          assertThat(a.c, equalTo(3));
        });
        it('works with typed objects too', function():void {
          // should copy only the message & name fields, not errorID as it is read-only
          // FIXME this example was bogus, to be replaced with something appropriate
        });
        it('as long as they have matching fields', function():void {
          // fail because of mismatched fields
          // FIXME this example was bogus, to be replaced with something appropriate
        });
      });
      
      describe('isA(type:Class)', function():void {
        it('returns an iterator function', function():void {
          assertThat(asx.object.isA(Error), instanceOf(Function));
        });
        it('iterator function returns true if the item is type', function():void {
          assertThat(asx.object.isA(Number)(3), equalTo(true));
        });
        it('iterator function returns false if the item is not type', function():void {
          assertThat(asx.object.isA(Error)(3), equalTo(false));
        });
      });
    });
  } 
}
