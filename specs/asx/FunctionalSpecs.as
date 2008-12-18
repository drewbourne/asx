package asx {

  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function FunctionalSpecs():void {

    function plusOne(n:Number):Number { return n + 1; };
    function timesTwo(n:Number):Number { return n * 2; };
    function twoTimesXPlusY(x:Number, y:Number):Number { return 2 * x + y; };
    
    describe('Functional', function():void {

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
      
        it('sequences 2 * x + y', function():void {
        
          //function seq(...fns):Number { return Functional.sequence.apply(null, fns); }
          var seq:Function = Functional.sequence;
          function num(n:Number):Function { return function(memo:Number, ...rest):Number { return n; }};
          function mul(n:Number):Function { return function(memo:Number, ...rest):Number { return memo * n; }};
          function div(n:Number):Function { return function(memo:Number, ...rest):Number { return memo / n; }};
          function mod(n:Number):Function { return function(memo:Number, ...rest):Number { return memo % n; }};
          function add(n:Number):Function { return function(memo:Number, ...rest):Number { return memo + n; }};
          function sub(n:Number):Function { return function(memo:Number, ...rest):Number { return memo - n; }};
        
          assertThat(seq(num(2), mul(2), add(3))(0), equalTo(7));
          assertThat(seq(num(2), mul(2), add(3))(189182), equalTo(7));
          assertThat(seq(mul(2), add(3))(2), equalTo(7));
          assertThat(seq(mul(2), add(3), add(3))(2), equalTo(10));
          
          function ary(array:Array=null):Function { 
            return function(memo:Array, ...rest):Array { return memo || []; }
          };
            
          function push(value:Object):Function { 
            return function(memo:Array, ...rest):Array { memo.push(value); return memo; }
          };
            
          function pop():Function { 
            return function(memo:Array, ...rest):Array { memo.pop(); return memo; }
          };
          
          assertThat(seq(ary([]), push(1), push(2), push(3), pop())(null), equalTo([1, 2]));
          assertThat(seq(ary([]), push(1), push(2), push(3), pop())([3, 4]), equalTo([3, 4, 1, 2]));
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

      /*
      describe('aritize', function():void {
        it('applies only `n` arguments to the fn when called', function():void {
          assertThat(["a", "b"].map(Functional.aritize(String.prototype.toUpperCase, 1)), equalTo(["A", "B"]));
        });
      });
      */
    
      describe('lambda', function():void {
      
        /*
            1+              function(n:Number):Number { return 1 + n; }
            2*
            3/
            4-
            %5            
            x y -> 6*x+y
            >7            Boolean
            <8            Boolean
            +             Number    function(...args):Number { return inject(0, function(m:Number, n:Number):Number { return m + n; }); }
            -             Number
            *
            /
            %
        */
 
        /*
        var L:Function = Functional.lambda;
      
        describe('operators', function():void {
          it('+', function():void {
            assertThat(L('+')(1, 2, 3, 4), equalTo(10));
          });
          it('-', function():void {
            assertThat(L('-')(1, 2, 3, 4), equalTo(-8));
          });
          it('*', function():void {
            assertThat(L('*')(1, 2, 3, 4), equalTo(24));
          });
          it('/', function():void {
            assertThat(L('/')(10, 5, 5), equalTo(1));
          });
          it('%', function():void {
            assertThat(L('%', 10, 4), equalTo(2));
          });
        });
      
        it('comparisons', function():void {
          it('>', function():void {
            assertThat(L('>')(3, 2, 1), equalTo(true));
            assertThat(L('>')(1, 2, 3), equalTo(false));
          });
          it('<', function():void {
            assertThat(L('<')(1, 2, 3), equalTo(true));
            assertThat(L('<')(3, 2, 1), equalTo(false));
          });
          it('==', function():void {
            assertThat(L('==')(2, 2, 2), equalTo(true));
            assertThat(L('==')(1, 2, 3), equalTo(false));
          });
          it('===', function():void {
          
          });
        });
      
        it('support numbers', function():void {
          it('+3', function():void {
            assertThat(L('+3')(1), )
          });
        });
        */
      });
      
    });
  }
}