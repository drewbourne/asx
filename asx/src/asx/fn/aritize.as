package asx.fn {  
  
  /**
   * Returns a function that passes only the specified number of arguments to the function.
   *  
   * Useful to convert functions for use as iterator functions with Array#forEach, Array#map, etc.
   *  
   * @param fn Function to be wrapped
   * @param n Number of parameters to pass to fn
   * @return Function accepting <code>...rest</code>
   * @example
   *  <listing version="3.0">
   *  function titleCase(str:String):String {
   *    return str.split(" ").map(function(str:String, i:int, a:Array):String {
   *      return str[0].toUpperCase() + str.slice(1).toLowerCase();
   *    }).join(" ");
   *  }
   *  
   *  var strings:Array = ["MixedCase", "UPPER CASE", "lower case"];
   *  var result:Array = strings.map(aritize(titleCase, 1));
   *  assertThat(result, equalTo("Mixedcase", "Upper Case", "Lower Case"));
   *  </listing>
   */
  public function aritize(fn:Function, n:int):Function {
    return function(...rest):Object {
      return fn.apply(null, rest.slice(0, n));
    }
  } 
}
