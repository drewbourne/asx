package asx.fn {  
  
  /**
   * Identity function, returns whatever is given the first parameter
   */
  public function I(...rest):Object {
    return rest[0];
  }
}
