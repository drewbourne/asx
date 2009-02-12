package asx.string {  
   
  // TODO test capitalize
  // TODO examples for capitalize;
  public function capitalize(value:String):String {
    return value.charAt(0).toUpperCase() + value.substr(1);
  }
}
