package asx.array { 
  
  public function shuffle(array:Array):Array {
    
    return array.sort(shuffleIt);
  } 
}

internal function shuffleIt(a:Object, b:Object):int {
  return -1 + Math.round(Math.random() * 2);
}