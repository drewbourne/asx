package asx { 
  
  import asx.fn.partial;
  import asx.object.*;
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.errors.IllegalOperationError;
  import org.hamcrest.*;
  import org.hamcrest.core.*;
  import org.hamcrest.object.*;
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
          // FIXME this example was bogus, to be replaced with something appropriate
        });
        it('as long as they have matching fields', function():void {
          // fail because of mismatched fields
          // FIXME this example was bogus, to be replaced with something appropriate
        });
      });
      
      describe('isA(klass:Class):Function', function():void {
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
      
      describe('newInstance(klass:Class, ...constructorArgs):Object', function():void {
        it('creates a new instance of type', function():void {
          assertThat(newInstance(Sprite), instanceOf(Sprite));
        });
        it('explodes if you forget to pass in required constructor arguments', function():void {
          assertThat(function():void {
            newInstance(Event);
          }, throws(ArgumentError));
        });
        it('creates a new instance of type with constructor arguments', function():void {
          assertThat(newInstance(Event, ["eventType", true, false]), instanceOf(Event));
        });
        it('works for up to 10 constructor arguments', function():void {
          assertThat(newInstance(Consumer).consumed, equalTo([]));
          assertThat(newInstance(Consumer, []).consumed, equalTo([]));
          assertThat(newInstance(Consumer, [1]).consumed, equalTo([1]));
          assertThat(newInstance(Consumer, [1, 2]).consumed, equalTo([1, 2]));
          assertThat(newInstance(Consumer, [1, 2, 3]).consumed, equalTo([1, 2, 3]));
          assertThat(newInstance(Consumer, [1, 2, 3, 4]).consumed, equalTo([1, 2, 3, 4]));
          assertThat(newInstance(Consumer, [1, 2, 3, 4, 5]).consumed, equalTo([1, 2, 3, 4, 5]));
          assertThat(newInstance(Consumer, [1, 2, 3, 4, 5, 6]).consumed, equalTo([1, 2, 3, 4, 5, 6]));
          assertThat(newInstance(Consumer, [1, 2, 3, 4, 5, 6, 7]).consumed, equalTo([1, 2, 3, 4, 5, 6, 7]));
          assertThat(newInstance(Consumer, [1, 2, 3, 4, 5, 6, 7, 8]).consumed, equalTo([1, 2, 3, 4, 5, 6, 7, 8]));
          assertThat(newInstance(Consumer, [1, 2, 3, 4, 5, 6, 7, 8, 9]).consumed, equalTo([1, 2, 3, 4, 5, 6, 7, 8, 9]));
          assertThat(newInstance(Consumer, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).consumed, equalTo([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]));
        });
        it('explodes if you pass too many arguments', function():void {
          assertThat(function():void {
            newInstance(Consumer, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
          }, throws(IllegalOperationError));
        });
      });
    });
  } 
}

// a little something to help test newInstance
internal class Consumer {
  private var _consumed:Array;
  
  public function Consumer(...rest) {
    _consumed = rest;
  }
  
  public function get consumed():Array {
    return _consumed;
  }
}