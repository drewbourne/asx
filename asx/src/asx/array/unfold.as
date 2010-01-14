package asx.array { 

  /**
   * Unfolds a value using a predicate, transformer, and incrementor functions.
   *   
   * @param initial Seed value for the unfold
   * @param predicate Determines whether to continue processing the unfold. Must match: function(state:Object):Boolean;
   * @param transformer Transforms the state to the next result. Must match: function(state:Object):Object;
   * @param incrementor Increments the state to a next state. Must match: function(state:Object):Object;
   * @return result Array of the unfold transformations
   */
  public function unfold(initial:Object, predicate:Function, transformer:Function, incrementor:Function):Array {

    var result:Array = [];
    var state:Object = initial;
      
    while (predicate(state)) {
      result[result.length] = transformer(state)
      state = incrementor(state);
    } 
      
    return result;
  } 
}
