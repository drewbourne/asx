package {
  
  import asx.*;
  
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
      // StringMethodsSpecs();
      
      run(Spec.spec.currentExampleGroup);
    }
  }
}