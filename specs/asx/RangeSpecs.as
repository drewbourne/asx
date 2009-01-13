package asx { 
  
  public function RangeSpecs():void {
    describe('asx.object.Range', function():void {
      var range:Range;
      
      describe('should act like an Array', function():void {
        // cant extend Array 
        // so we'll instead provide #every, #filter, #forEach, #map, #some

        before(function():void {
          range = new Range(1, 10);
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

internal class Range extends Proxy {
  public static var successors:Object {
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
    
  }
}
