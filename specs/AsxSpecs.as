package {
  
  import asx.*;
  
  import sandbox.*;
  
  import spectacular.framework.SpectacularSpecRunner;
  import spectacular.framework.Spec;
  import spectacular.framework.TraceSpecReporter;
  
  public class AsxSpecs extends SpectacularSpecRunner {

    public function AsxSpecs() {
      
      super();

      ArrayMethodsSpecs();
      FunctionMethodsSpecs();
      NumberMethodsSpecs();
      // ObjectMethodsSpecs();
      StringMethodsSpecs();
      
      WithSpecs();
      
      run(Spec.spec.currentExampleGroup);
    }
  }
}