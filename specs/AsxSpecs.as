package {
  
  import asx.*;
  
  import sandbox.*;
  
  import spectacular.framework.SpectacularSpecRunner;
  import spectacular.framework.Spec;
  import spectacular.framework.TraceSpecReporter;
  
  [SWF(backgroundColor="#F0F0F0")]
  public class AsxSpecs extends SpectacularSpecRunner {

    public function AsxSpecs() {
      
      super();

      ArrayMethodsSpecs();
      // DateMethodsSpecs();
      FunctionMethodsSpecs();
      NumberMethodsSpecs();
      StringMethodsSpecs();
      
      FunctionalSpecs();
      
      run(Spec.spec.currentExampleGroup);
    }
  }
}