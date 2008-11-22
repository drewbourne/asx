package asx {

  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function ObjectMethodsSpecs():void {

    describe('ObjectMethods', function():void {
      describe('unfold', function():void {
        it('should continue until stop condition is met', function():void {

          expect(ObjectMethods.unfold, 10, function(value:Number):Number { 
            return value - 2; 
          }).should(eq, [10, 8, 6, 4, 2]);

          expect(ObjectMethods.unfold, 10, function(value:Number):Number { 
            return value - 2; 
          }, function(value:Number):Boolean {
            return value > 0;
          }).should(eq, [10, 8, 6, 4, 2]);
        });
      });
    });
  }
}
