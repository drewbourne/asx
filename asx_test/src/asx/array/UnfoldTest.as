package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class UnfoldTest
  {
    [Test]
    public function unfold_forSimpleValues():void 
    {
      var p:Function = function(n:Number):Boolean { return n > 0; };
      var t:Function = function(n:Number):Number { return n - 2; };
      var i:Function = t;

      assertThat(
        unfold(10, p, t, i), 
        equalTo([8, 6, 4, 2, 0]));
    }
    
    [Test]
    public function unfold_forComplexValues():void 
    {
      var parent:Object = { values: [1, 2, 3] };
      var child1:Object = { parent: parent, values: [4, 5, 6] };
      var child2:Object = { parent: child1, values: [7, 8, 9] };

      var predicate  :Function = function(o:Object):Boolean { return o && o.values != null };
      var transformer:Function = function(o:Object):Object { return o.values; };
      var incrementor:Function = function(o:Object):Object { return o.parent; }

      assertThat(
        unfold(child2, predicate, transformer, incrementor), 
        equalTo([[7, 8, 9], [4, 5, 6], [1, 2, 3]]));
    }
  }
}
