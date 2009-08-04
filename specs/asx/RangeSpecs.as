package asx { 
  
  
  
  public function RangeSpecs():void {
    
    describe('asx.object.NumberRange', function():void {
      var range:NumberRange;
      
      it("counts up when start is less than stop", function():void {
        range = new NumberRange(0, 10);
        for (var i:int = 0, n:int = 10; i < n; i++) {
          assertThat(range[i], equalTo(i));
        }
      });

      it("counts down when start is greater than stop", function():void {
        range = new NumberRange(10, 0);
        for (var i:int = 0, n:int = 10; i < n; i++) {
          assertThat(range[i], equalTo(10 - i));
        }
      });
      
      describe("should act like an array", function():void {
        before(function():void {
          range = new NumberRange(0, 10);
        });
        
        it("get [n] returns value", function():void {
          assertThat(range[5], equalTo(6));
        });
        
        it("set [n] complains as unsupported", function():void {
          assertThat(function():void {
            range[5] = 1;
          }, throws(IllegalOperationError));
        });
        
        it("get length", function():void {
          assertThat(range.length, equalTo(10));
        });
        
        // #every, #forEach, #filter, #map, #some
      });
      
      describe("with step value", function():void {
        describe("positive", function():void {
          // good combination of start/stop/step
          range = new NumberRange(0, 10, 2);
        });
        describe("negative", function():void {
          // good combination of start/stop/step
          range = new NumberRange(10, 0, -2);
        });
        describe("invalid", function():void {
          // bad combination of start/stop/step
          range = new NumberRange(0, 10, -2);
          range = new NumberRange(10, 0, 2);
        });
      });
    });
    
    /*describe("asx.object.IntRange", function():void {
        // as per NumberRange
    });
    
    describe("asx.object.UintRange", function():void {
        // as per NumberRange      
    });*/
    
    describe("asx.object.StringRange", function():void {

    });
    
    describe("asx.object.ObjectRange", function():void {
      
    });
    
    describe("asx.object.range(start:Object, p:Function, i:Function)", function():void {
      
    });
    
    describe('asx.object.Range', function():void {
      var range:Range;
      
      describe('should act like an Array', function():void {
        // cant extend Array 
        // so we'll instead provide #every, #filter, #forEach, #map, #some

        before(function():void {
          range = new Range(1, 10);
        });
        
        it('supports get [x]', function():void {
          
        });
        
        it('complains on set [x]', function():void {
          
        });
        
        it('??? returns 0 for .length', function():void {
          // unless its a Number, int, uint Range
        });
        
        it('#every', function():void {
          assertThat(range.every(lt(10)), true);
        });
        
        it('#filter', function():void {
          assertThat(range.filter(mod(2)), equalTo([1, 3, 5, 7, 9]));
        });
        
        it('#forEach', function():void {
          var called:int = 0;
          range.forEach(function(n:Number):void {
            called++;
          });
          assertThat(called, equalTo(10));
        });
        
        it('#map', function():void {

          /*square = partial(mul, _); */
          // function (_) { return mul(_); }
          
          /*square = partial(sequence, partial(mul, _), _);*/
          // function (_) { return sequence(partial(mul, _), _); }
          
          // S(f, g)(args...) == f(g(args...), args...)
          /*square = aritize(S(sequence, mul), 1);*/
          /*square = fn('_*_');*/
          
          assertThat(range.map(square), equalTo([ 1, 4, 9, 25, 36, 49, 64, 81 ]));
        });
        
        it('#some', function():void {
          assertThat(range.some(eq(1)), true);
          assertThat(range.some(eq(11)), false);
        });
      });
      
      it('should be lazy', function():void {
        // this should NOT allocate a value for every item in the range
        // new Range(int.MIN_VALUE, int.MAX_VALUE);
        
        /*
        sum( 
          new Range(1, 10)    // Range
            .map(square)      // returns a Range with a different next() function
            .filter(lt(50))   // returns a Range with a different next() function
            .toArray()        // returns an Array of ALL the values
        );                    // number
        */
      });
      
      it('should return a sequence of x', function():void {
        
      });
      
      it('should be extensible for non-core types', function():void {
        // new Range(start, end, exclusive, function(current:Object):Object {
        //   with(current) { do { return magic(); } };
        // });
      });
    });
  } 
}

import flash.utils.Proxy;
import flash.utils.flash_proxy;

use namespace flash_proxy;

/*internal class Range extends Proxy {

  public static var successors:Object = {
    'String': function(s:String):String { 
      return String.fromCharCode(++(s.charCodeAt(0)));
    },
    'Number': function(n:Number):Number {
      return bound(++n, Number.MIN_VALUE, Number.MAX_VALUE);
    },
    'int': function(n:int):int {
      return bound(++n, int.MIN_VALUE, int.MAX_VALUE);
    }, 
    'uint': function(n:uint):uint {
      return bound(++n, uint.MIN_VALUE, uint.MAX_VALUE);
    }
  };
  
  public function Range(start:Object, end:Object, succ:Function) {
    super();
  }
}*/


// range is an on-request unfold of the next state
// where the transformer and incrementor are the same function (usually)

internal class Range {
  
  private var _initial:Object;
  private var _predicate:Function;
  private var _incrementor:Function;
  
  public function Range(initial:Object, predicate:Function, incrementor:Function) {
    
    _initial = initial;
    _predicate = predicate;
    _incrementor = incrementor;
  }
  
  public function toArray():Array {
    return unfold(_initial, _predicate, _incrementor, _incrementor);
  }
  
  public function map(fn:Function):Array {
    return unfold(_initial, _predicate, fn, _incrementor);
  }
  
  protected function inject(memo:Object, fn:Function):Object {
    var state:Object = _initial;
    while (predicate(state)) {
      result = fn(memo, state);
      state = _incrementor(state);
    }
    return memo;
  }
  
  public function filter(fn:Function):Array {
    
    return inject([], function(memo:Array, state:Object):Array {
      if (fn(state)) {
        memo.push(state);
      }
      return memo;
    }) as Array;
    
    // not quite unfold
    var result:Array = [];
    var state:Object = _initial;
      
    while (predicate(state)) {
      
      // ---{
      if (fn(state)) { 
        result.push(state);
      }
      // }---
      
      state = _incrementor(state);
    }
      
    return result;
  }
  
  public function every(fn:Function):Boolean {
    
 
    
    // not quite unfold
    var result:Boolean = true;
    var state:Object = _initial;
    while(predicate(state)) {
      
      result = fn(start);
      // we'll short-circuit when result fails
      if (!result) {
        break;
      }
      state = _incrementor(state);
    }
    return result;
  }
  
  public function some(fn:Function):Boolean {

     // not quite unfold
     var result:Boolean = false;
     var state:Object = _initial;
     while(predicate(state)) {

       result = fn(start);
       // we'll short-circuit when result fails
       if (result) {
         break;
       }
       state = _incrementor(state);
     }
     return result;
   }
}
