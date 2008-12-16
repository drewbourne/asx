package sandbox {

  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function WithSpecs():void {

    describe('with', function():void {
      it('allows mixing class and global functions', function():void {
        
        var example:WithExample = new WithExample();
        with (example) {
          assertThat(highFive(), equalTo(5));
        }
      });
      
      it('allows nesting with statements', function():void {
        with () { 
          with () {
          
          }
        }
      });
    });
  }
}

internal class WithExample {
  
  public function WithExample() {
    
  }
  
  public function highFive():int {
    return 5;
  }
}