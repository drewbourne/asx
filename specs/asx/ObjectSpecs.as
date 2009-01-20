package asx { 
  
  public function ObjectSpec():void {
    
    describe('asx.object', function():void {
      describe('merge(a:Object, b:Object):Object', function():void {
        it('copies enumerable fields from b to a', function():void {
          ; // use anonymous objects
        });
        it('works with typed objects too', function():void {
          ; // pass because objects are same type
        });
        it('as long as they have matching fields', function():void {
          ; // fail because of mismatched fields
        });
      });
    });
  } 
}
