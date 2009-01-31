package asx {

  import asx.number.*;
  import spectacular.dsl.*;
  import org.hamcrest.*;

  // TODO mean median mode
  // TODO add, sub, mul, div, mod, pow
  // TODO eq, gt, gte, lt, lte
  
  public function NumberSpecs():void {

    describe('NumberMethods', function():void {
      describe('between', function():void {
        it('indicates if the value is between the minimum and maximum values', function():void {
          assertThat(between(0, 0, 1), equalTo(true));
          assertThat(between(0, 1, 10), equalTo(false));
          assertThat(between(1, 1, 10), equalTo(true));
          assertThat(between(5, 1, 10), equalTo(true));
        });
      });
  
      describe('bound', function():void {
        it('leaves the value as is if between the minimum and maximum values', function():void {
          assertThat(bound(0, 0, 0), equalTo(0));
          assertThat(bound(0, 0, 1), equalTo(0));
          assertThat(bound(1, 0, 1), equalTo(1));
          assertThat(bound(0.5, 0, 1), equalTo(0.5)); // perhaps closeTo(0.5); ?
        });
    
        it('returns the minimum value if value is less than the minimum value', function():void {
          assertThat(bound(-1, 0, 1), equalTo(0));
          assertThat(bound(0, 1, 10), equalTo(1));
        });
    
        it('returns the maximum value if value is greater than the maximum value', function():void {
          assertThat(bound(2, 0, 1), equalTo(1));
          assertThat(bound(11, 1, 10), equalTo(10));
        });
      });
 
      describe('exclude', function():void {
        it('returns a value outside the minimum and maximum range', function():void {
          assertThat(exclude(0, 0, 0), isA(NaN));
          assertThat(exclude(0, 1, 10), equalTo(0));
          assertThat(exclude(0.1, -1, 1), equalTo(1));
          assertThat(exclude(-0.1, -1, 1), equalTo(-1));
          assertThat(exclude(6, 1, 10), equalTo(10));
        });
      });
  
      describe('overflow', function():void {
        it('returns a value between the minimum and maximum range', function():void {
          assertThat(overflow(0, 0, 0), equalTo(0));
          assertThat(overflow(0, 1, 10), equalTo(9));
          assertThat(overflow(12, 1, 10), equalTo(3));
        });
      });
  
      describe('snap', function():void {
        it('rounds to the nearest multiple of the step value', function():void {
          assertThat(snap(0), equalTo(0));
          assertThat(snap(1), equalTo(1));
          assertThat(snap(0.9, 2), equalTo(0));
          assertThat(snap(1, 2), equalTo(2));
          assertThat(snap(1.1, 2), equalTo(2));
          assertThat(snap(2, 3), equalTo(3));
        });
    
        it('offsets from the origin value', function():void {
          assertThat(snap(1, 2, 1), equalTo(3));
          assertThat(snap(4, 4, 1), equalTo(5));
        });
      });
  
      describe('normalize', function():void {
        it('takes a value and a range and scale the value to between 0 and 1', function():void {
          assertThat(normalize(0, 0, 10), equalTo(0));
          assertThat(normalize(5, 0, 10), equalTo(0.5));
          assertThat(normalize(1, 0, 4), equalTo(0.25));
        });
      });
  
      describe('interpolate', function():void {
        it('takes a normalized value and a range and return the actual value for the interpolated value in that range', function():void {
          assertThat(interpolate(0, 0, 10), equalTo(0));
          assertThat(interpolate(0.4, 10, 50), equalTo(26));
        });
      });
  
      describe('sum', function():void {
        it('adds all the values together', function():void {
          var values:Array = [1, 2, 3, 4, 5];
          assertThat(sum(values), equalTo(15));
        });
      });
      
      describe('times', function():void {
        it('maps an iterator function n times', function():void {
          var called:int = 0;
          times(5, function(n:int, i:int, a:Array):void {
            called++;
          });
          assertThat(called, equalTo(5));
        });
        it('returns the result of each function call', function():void {
          var result:Array = times(5, function(n:int, i:int, a:Array):int {
            return n * n;
          });
          assertThat(result, equalTo([0, 1, 4, 9, 16]));
        });
        it('returns an empty array if n is less than 0', function():void {
          var result:Array = times(-1, function(n:int, i:int, a:Array):int {
            return n;
          });
          assertThat(result, equalTo([]));
        });
      });
    });
  }
}