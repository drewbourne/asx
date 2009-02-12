package asx {

  import asx.string.*;
  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function StringSpecs():void {

    describe('asx.string', function():void {
      describe('repeat', function():void {
        it('repeats the given string the given number of times', function():void {
          assertThat(repeat('', 0), equalTo(''));
          assertThat(repeat('', 1), equalTo(''));
          assertThat(repeat(' ', 0), equalTo(''));
          assertThat(repeat(' ', 1), equalTo(' '));
          assertThat(repeat(' ', 2), equalTo('  '));
          assertThat(repeat('-+', 2), equalTo('-+-+'));
        });
      });
  
      describe('padStart', function():void {
        it('adds the specified amount of padding from the pad string to the left side of the given value string', function():void {
          assertThat(padStart('hello', 10), equalTo('     hello'));
          assertThat(padStart('hello', 10, '-+('), equalTo('+(-+(hello'));
        });
      });
  
      describe('padEnd', function():void {
        it('adds the specified amount of padding from the pad string to the right side of the given value string', function():void {
          assertThat(padEnd('hello', 10), equalTo('hello     '));
          assertThat(padEnd('hello', 10, ')+-'), equalTo('hello)+-)+'));
        });
      });
      
      describe('trim', function():void {
        it('removes whitespace characters from the start and end of the given string', function():void {
          assertThat(trim('  start only'), equalTo('start only'));
          assertThat(trim('end only '), equalTo('end only'));
          assertThat(trim('   both    '), equalTo('both'));
        });
      });
      
      describe('trimStart', function():void { 
        it('removes whitespace characters from the start of the given string', function():void {
          assertThat(trimStart('  start only'), equalTo('start only'));
          assertThat(trimStart('end only '), equalTo('end only '));
          assertThat(trimStart('   both    '), equalTo('both    '));
        });
      });
      
      describe('trimEnd', function():void {
        it('removes whitespace characters from the end of the given string', function():void {
          assertThat(trimEnd('  start only'), equalTo('  start only'));
          assertThat(trimEnd('end only '), equalTo('end only'));
          assertThat(trimEnd('   both    '), equalTo('   both'));
        });
      });
      
      describe('normalize', function():void {
        it('trims the string', function():void {
          assertThat(normalize('  hello '), equalTo('hello'));
        });
        it('replaces sequences of whitespace with a single space', function():void {
          assertThat(normalize('k thx bye'), equalTo('k thx bye'));
          assertThat(normalize('k   thx bye'), equalTo('k thx bye'));
          assertThat(normalize('k\tthx\nbye'), equalTo('k thx bye'));
          assertThat(normalize('k \t thx\n\n\tbye'), equalTo('k thx bye'));
        });
      })
    });
    
  }
}
