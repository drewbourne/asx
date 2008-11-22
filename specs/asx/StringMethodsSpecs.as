package asx {

  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function ObjectMethodsSpecs():void {

    describe('StringMethods', function():void {
      describe('repeat', function():void {
        it('should repeat the given string the given number of times', function():void {
          expect(StringMethods.repeat, '', 0).should(eq, '');
          expect(StringMethods.repeat, '', 1).should(eq, '');
          expect(StringMethods.repeat, ' ', 0).should(eq, '');
          expect(StringMethods.repeat, ' ', 1).should(eq, ' ');
          expect(StringMethods.repeat, ' ', 2).should(eq, '  ');
          expect(StringMethods.repeat, '-+', 2).should(eq, '-+-+');
        });
      });
  
      describe('padLeft', function():void {
        it('should add the specified amount of padding from the pad string to the left side of the given value string', function():void {
          expect(StringMethods.padLeft, 'hello', 10).should(eq, '     hello');
          expect(StringMethods.padLeft, 'hello', 10, '-+(').should(eq, '+(-+(hello');
        });
      });
  
      describe('padRight', function():void {
        it('should add the specified amount of padding from the pad string to the right side of the given value string', function():void {
          expect(StringMethods.padRight, 'hello', 10).should(eq, 'hello     ');
          expect(StringMethods.padRight, 'hello', 10, ')+-').should(eq, 'hello)+-)+');
        });
      });
    });
    
  }
}
