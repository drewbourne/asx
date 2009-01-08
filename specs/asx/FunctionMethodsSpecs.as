package asx {
  
  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function FunctionMethodsSpecs():void {
  
    describe('FunctionMethods', function():void {
      describe('partial', function():void {
        it("should be awesome", function():void {
          
          function list(a:int, b:int, c:int, d:int):Array {
            return [a, b, c, d];
          };
          
          // aliases for brevity
          var partial:Function = FunctionMethods.partial;
          var _:* = undefined;
          
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
      });
      
      describe('curry', function():void {
        it("creates a new function that applies the original arguments and then the new arguments", function():void {
          
        });
      });
      
      describe("rcurry", function():void {
        
      });
      
      describe("ncurry", function():void {
        
      });
      
      describe("rncurry", function():void {
        
      });
      
      describe('iterator', function():void {
        it('creates a function that can be used with the Array methods', function():void {

          // TODO we cannot check the arity of the returned function so there is not much point doing this
          /*expect(FunctionMethods.toIterator, function():void {}).should(eq, null);
          expect(FunctionMethods.toIterator, function(value:Object):void {}).should(eq, null);
          expect(FunctionMethods.toIterator, function(value:Object, i:int):void {}).should(eq, null);
          expect(FunctionMethods.toIterator, function(value:Object, i:int, a:Array):void {}).should(eq, null);
          expect(FunctionMethods.toIterator, function(value:Object, ...rest):void {}).should(eq, null);*/

          // common functions like this could be abstracted to: 
          // -- FunctionMethods.toIterator(NumberMethods.greaterThan(10));
          // -- [].filter(f('> 10'));
          var isGreaterThan10:Function = function(value:Number):Boolean {
            return value > 10;
          };

          // the typing saving is negligible, *sigh* -- unless we include aliases like $i = FunctionMethods.toIterator;          
          var isGreaterThan10Iterator:Function = FunctionMethods.toIterator(isGreaterThan10);

          assertThat([0, 10, 20, 30].filter(isGreaterThan10Iterator), equalTo([20, 30]))
        });
      });
    });
  }
}
