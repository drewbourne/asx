package asx {
  
  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function FunctionMethodsSpecs():void {
  
    describe('FunctionMethods', function():void {
      describe('iterator', function():void {
        it('should create a function that can be used with the Array methods', function():void {

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

          assertThat([0, 10, 203, 30].filter(isGreaterThan10Iterator), equalTo([20, 30]))
        });
      });
    });
  }
}
