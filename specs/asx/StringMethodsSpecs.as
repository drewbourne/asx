package asx {

  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function StringMethodsSpecs():void {

    describe('StringMethods', function():void {
      describe('repeat', function():void {
        it('repeats the given string the given number of times', function():void {
          
          assertThat(StringMethods.repeat('', 0), equalTo(''));
          assertThat(StringMethods.repeat('', 1), equalTo(''));
          assertThat(StringMethods.repeat(' ', 0), equalTo(''));
          assertThat(StringMethods.repeat(' ', 1), equalTo(' '));
          assertThat(StringMethods.repeat(' ', 2), equalTo('  '));
          assertThat(StringMethods.repeat('-+', 2), equalTo('-+-+'));
        });
      });
  
      describe('padLeft', function():void {
        it('adds the specified amount of padding from the pad string to the left side of the given value string', function():void {
          assertThat(StringMethods.padLeft('hello', 10), equalTo('     hello'));
          assertThat(StringMethods.padLeft('hello', 10, '-+('), equalTo('+(-+(hello'));
        });
      });
  
      describe('padRight', function():void {
        it('adds the specified amount of padding from the pad string to the right side of the given value string', function():void {
          assertThat(StringMethods.padRight('hello', 10), equalTo('hello     '));
          assertThat(StringMethods.padRight('hello', 10, ')+-'), equalTo('hello)+-)+'));
        });
      });
      
      describe('trim', function():void {
        it('removes whitespace characters from the start and end of the given string', function():void {
          assertThat(StringMethods.trim('  start only'), equalTo('start only'));
          assertThat(StringMethods.trim('end only '), equalTo('end only'));
          assertThat(StringMethods.trim('   both    '), equalTo('both'));
        });
      });
      
      describe('trimLeft', function():void { 
        it('removes whitespace characters from the start of the given string', function():void {
          assertThat(StringMethods.trimLeft('  start only'), equalTo('start only'));
          assertThat(StringMethods.trimLeft('end only '), equalTo('end only '));
          assertThat(StringMethods.trimLeft('   both    '), equalTo('both    '));
        });
      });
      
      describe('trimRight', function():void {
        it('removes whitespace characters from the end of the given string', function():void {
          assertThat(StringMethods.trimRight('  start only'), equalTo('  start only'));
          assertThat(StringMethods.trimRight('end only '), equalTo('end only'));
          assertThat(StringMethods.trimRight('   both    '), equalTo('   both'));
        });
      });
      
      describe('normalize', function():void {
        it('trims the string', function():void {
          assertThat(StringMethods.normalize('  hello '), equalTo('hello'));
        });
        it('replaces sequences of whitespace with a single space', function():void {
          assertThat(StringMethods.normalize('k thx bye'), equalTo('k thx bye'));
          assertThat(StringMethods.normalize('k   thx bye'), equalTo('k thx bye'));
          assertThat(StringMethods.normalize('k\tthx\nbye'), equalTo('k thx bye'));
          assertThat(StringMethods.normalize('k \t thx\n\n\tbye'), equalTo('k thx bye'));
        });
      })
    });
    
  }
}
