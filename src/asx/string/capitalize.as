package asx.string {  
   
  // TODO test capitalize
  // TODO examples for capitalize;
  public function capitalize(value:String):String {
    return value.slice(0, 1).toUpperCase() + value.slice(1);
  }
}
