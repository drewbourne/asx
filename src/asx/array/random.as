package asx.array { 
  
  public function random(array:Array):Object {
    return array[ Math.floor(Math.random() * array.length) ];
  }
}