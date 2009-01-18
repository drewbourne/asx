package asx.array { 
  
  import asx.fn._;
  import asx.fn.aritize;  
  import asx.fn.not;
  import asx.fn.partial;
  
  public function difference(a:Array, b:Array):Array {
    
    var result:Array = [];
    
    result = result.concat(a.filter(aritize(partial(not(contains), b, _), 1)));
    result = result.concat(b.filter(aritize(partial(not(contains), a, _), 1)));
    
    return result;
  } 
}
