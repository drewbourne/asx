package asx {
  
  import asx.fn.*;
  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function FunctionSpecs():void {
  
    describe('asx.fn', function():void {
      describe('aritize', function():void {
        it("should pass only the specified number of arguments to the wrapped function when called", function():void {
          
          var acceptAndReturn:Function = function(...rest):Array {
            return rest;
          }
          
          assertThat(aritize(acceptAndReturn, 1)(1, 2, 3).length, equalTo(1));
          assertThat(aritize(acceptAndReturn, 1)(1, 2, 3), equalTo([1]));
          assertThat(aritize(acceptAndReturn, 2)(1, 2, 3).length, equalTo(2));
          assertThat(aritize(acceptAndReturn, 2)(1, 2, 3), equalTo([1, 2]));
          assertThat(aritize(acceptAndReturn, 3)(1, 2, 3).length, equalTo(3));
          assertThat(aritize(acceptAndReturn, 3)(1, 2, 3), equalTo([1, 2, 3]));
        });
      });
      
      describe('partial', function():void {
        it("should be awesome", function():void {
          
          function list(a:int, b:int, c:int, d:int):Array {
            return [a, b, c, d];
          };
          
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
        it("can mimic aritize by specify _ for the number of arguments to pass on", function():void {
          // but slower
          var acceptAndReturn:Function = function(...rest):Array {
            trace('acceptAndReturn', rest.join(', '));
            return rest;
          }
          
          assertThat(partial(acceptAndReturn, _)(1, 2, 3).length, equalTo(1));
          assertThat(partial(acceptAndReturn, _)(1, 2, 3), equalTo([1]));
          assertThat(partial(acceptAndReturn, _, _)(1, 2, 3).length, equalTo(2));
          assertThat(partial(acceptAndReturn, _, _)(1, 2, 3), equalTo([1, 2]));
          assertThat(partial(acceptAndReturn, _, _, _)(1, 2, 3).length, equalTo(3));
          assertThat(partial(acceptAndReturn, _, _, _)(1, 2, 3), equalTo([1, 2, 3]));
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
      
      // S(f, g)(args...) == f(g(args...), args...)
      describe("S", function():void {
        
      });
    });
  }
}
