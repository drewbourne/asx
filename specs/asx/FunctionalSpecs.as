package asx {

  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function FunctionalSpecs():void {

    function plusOne(n:Number):Number { return n + 1; };
    function timesTwo(n:Number):Number { return n * 2; };
    function twoTimesXPlusY(x:Number, y:Number):Number { return 2 * x + y; };
    
    describe('compose', function():void {
      it('evaluates functions from right to left: f1(f2(f3(...(fn(...args)))))', function():void {
        var fn:Function = Functional.compose(plusOne, timesTwo);
        assertThat(fn(2), equalTo(5));
      });
    });
    
    describe('sequence', function():void {
      it('evaluates functions from left to right: fn(...(f3(f2(f1(...args)))))', function():void {
        var fn:Function = Functional.sequence(plusOne, timesTwo);
        assertThat(fn(2), equalTo(6));
      });
    });
    
    describe('reduce', function():void {
      it('applies `fn` to `init` and the first element of `sequence`', function():void {
        assertThat(Functional.reduce(twoTimesXPlusY, 0, [1]), 1);
      });
      it('then to the result and the second element, and so on', function():void {
        assertThat(Functional.reduce(twoTimesXPlusY, 0, [1, 0, 1, 0]), 10);
      });
    });
  }
}