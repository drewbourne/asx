package asx {
  
  import asx.fn.*;
  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function FunctionSpecs():void {
  
    describe('asx.fn', function():void {
      describe('aritize', function():void {
        it("should pass only the specified number of arguments to the wrapped function when called", function():void {
          
          var acceptAndReturn:Function = function(...rest):Array {
            return rest;
          }
          
          assertThat(aritize(acceptAndReturn, 1)(1, 2, 3).length, equalTo(1));
          assertThat(aritize(acceptAndReturn, 1)(1, 2, 3), equalTo([1]));
          assertThat(aritize(acceptAndReturn, 2)(1, 2, 3).length, equalTo(2));
          assertThat(aritize(acceptAndReturn, 2)(1, 2, 3), equalTo([1, 2]));
          assertThat(aritize(acceptAndReturn, 3)(1, 2, 3).length, equalTo(3));
          assertThat(aritize(acceptAndReturn, 3)(1, 2, 3), equalTo([1, 2, 3]));
        });
      });
      
      describe('partial', function():void {
        it("should be awesome", function():void {
          
          // FIXME write better specifications for the behaviour of partial please
          
          function list(a:int, b:int, c:int, d:int):Array {
            return [a, b, c, d];
          };
          
          assertThat(
            partial(list, 1, _, 2, _)(3, 4), 
            equalTo([1, 3, 2, 4]));
          assertThat(
            partial(list, 1, _, _, 2)(3, 4), 
            equalTo([1, 3, 4, 2]));
          assertThat(
            partial(list, _, _, _, _)(1, _, _, 2)(3, 4), 
            equalTo([1, 3, 4, 2]));
          assertThat(
            partial(list, _, _, _, _)(1)(3, _, 4)(2), 
            equalTo([1, 3, 2, 4]));
        });
        it("can mimic aritize by specifying _ for the number of arguments to pass on", function():void {
          // but it will definately be slower then aritize
          var acceptAndReturn:Function = function(...rest):Array {
            return rest;
          }
          
          assertThat(partial(acceptAndReturn, _)(1, 2, 3).length, equalTo(1));
          assertThat(partial(acceptAndReturn, _)(1, 2, 3), equalTo([1]));
          assertThat(partial(acceptAndReturn, _, _)(1, 2, 3).length, equalTo(2));
          assertThat(partial(acceptAndReturn, _, _)(1, 2, 3), equalTo([1, 2]));
          assertThat(partial(acceptAndReturn, _, _, _)(1, 2, 3).length, equalTo(3));
          assertThat(partial(acceptAndReturn, _, _, _)(1, 2, 3), equalTo([1, 2, 3]));
        });
      });
      
      describe('callProperty', function():void {
        it('calls the method on the item', function():void {
          var called:Boolean = false;
          var item:Object = { doIt: function():void { called = true; } };
          callProperty('doIt')(item);
          assertThat(called, equalTo(true));
        });
        it('passes initial arguments to method', function():void {
          var received:Array;
          var item:Object = { doIt: function(...args):void { received = args; } };
          callProperty('doIt', 1, "b", true)(item);
          assertThat(received, equalTo([1, "b", true]));
        });
        it('ignores arguments given with item', function():void {
          var received:Array;
          var item:Object = { doIt: function(...args):void { received = args; } };
          callProperty('doIt')(item, 1, "b", true);
          assertThat(received, equalTo([]));
        })
        it('returns the result of the method', function():void {
          var item:Object = { doIt: function(...args):Array { return [1, "b", true]; } };
          var result:Array = callProperty('doIt')(item);
          assertThat(result, equalTo([1, "b", true]));
        });
      });
      
      describe('getProperty', function():void {
        it('returns the value of the property on the item', function():void {
          var item:Array = [1, 2, 3];
          assertThat(getProperty('length')(item), equalTo(3));
        });
      });
      
      describe('setProperty', function():void {
        it('sets the value of the property on the item', function():void {
          var item:Object = { width: 0 };
          setProperty('width', 50)(item);
          assertThat(item.width, equalTo(50));
        });
        it('returns the item', function():void {
          var item:Object = { width: 0 };
          var result:Object = setProperty('width', 50)(item);
          assertThat(result, equalTo(item));
        });
      });
      
      describe('callFunction', function():void {
        it('calls the given function', function():void {
          var called:Boolean = false;
          var fn:Function = function():void {
            called = true;
            return;
          };
          callFunction()(fn);
          assertThat(called, equalTo(true));
        });
        it('passes args to inner fn', function():void {
          var received:Array = null;
          var fn:Function = function(...rest):void {
            received = rest;
          };
          callFunction(1, 2, 3)(fn);
          assertThat(received, equalTo([1, 2, 3]));
        });
        it('returns the result of the function', function():void {
          var fn:Function = function():Boolean {
            return true;
          };
          assertThat(callFunction()(fn), equalTo(true));
        });
      });
      
      describe('I', function():void {
        it('returns the item given as the first parameter', function():void {
          assertThat(I(1), equalTo(1));
          assertThat(I(true), equalTo(true));
          assertThat(I("string"), equalTo("string"));
        });
      });
      
      describe('K', function():void {
        it('returns a function that when invoked returns the item given as the initial parameter', function():void {
          assertThat(K(1)(3, 4), equalTo(1));
          assertThat(K(true)(false, 5, 6, 7), equalTo(true));
          assertThat(K("string")(), equalTo("string"));
        });
      });
    });
  }
}
