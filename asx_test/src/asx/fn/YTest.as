package asx.fn
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  // as3 implementations of http://blog.jcoglan.com/2008/01/10/deriving-the-y-combinator/
  
  public class YTest
  {
    [Test]
    public function derivingY1():void 
    {
      var factorial:Function = function(x:Number):Number {
         return x == 0 ? 1 : x * factorial(x - 1);
      }
      
      assertThat(factorial(5), equalTo(120));
    }

    [Ignore("broken, not really an issue")]
    [Test]
    public function derivingY2():void 
    {
      var f:Function = function(q:Function):Function {
        return function(x:Number):Number {
          return x == 0 ? 1 : x * q(x - 1);
        }
      }
            
      assertThat(f(f)(5), equalTo(120));  
    }
    
    [Test]
    public function derivingY3():void 
    {
      var factorial:Function = function(h:Function, x:Number):Number {
        return x == 0 ? 1 : x * h(h, x - 1);
      };
      
      assertThat(factorial(factorial, 5), equalTo(120));
    }
    
    [Test]
    public function derivingY4():void 
    {
      var factorial:Function = function(h:Function):Function {
        return function(x:Number):Number {
          return x == 0 ? 1 : x * h(h)(x - 1);
        }
      }
      
      assertThat(factorial(factorial)(5), equalTo(120));
    }
    
    [Test]
    public function derivingY5():void 
    {
      var factorial:Function = function(h:Function):Function {
        return function(x:Number):Number {
          var f:Function = function(q:Function, x:Number):Number {
            return x == 0 ? 1 : x * q(x - 1);
          }
          return f(h(h), x);
        }
      }
      
      assertThat(factorial(factorial)(5), equalTo(120));
    }
    
    [Test]
    public function derivingY6():void  
    {
      var factorial:Function = function(h:Function):Function {
        return function(x:Number):Number {
          var f:Function = function(q:Function):Function {
            return function (x:Number):Number {
              return x == 0 ? 1 : x * q(x - 1);
            }
          }
          return f(h(h))(x);
        }
      }
      
      assertThat(factorial(factorial)(5), equalTo(120));
    }
    
    [Test]
    public function derivingY7():void 
    {
      var f:Function = function(q:Function):Function {
        return function(x:Number):Number {
          return x == 0 ? 1 : x * q(x - 1);
        }
      }
      
      var factorial:Function = function(h:Function):Function {
        return function(x:Number):Number {
          return f(h(h))(x);
        }
      }
      
      assertThat(factorial(factorial)(5), equalTo(120));
    }
    
    [Test]
    public function derivingY8():void 
    {
      var Y1:Function = function(f:Function):Function {
        var g:Function = function(h:Function):Function {
          return function (x:Number):Number {
            return f(h(h))(x);
          }
        }
        return g(g);
      }
      
      var Y:Function = function(f:Function):Function {
        return (function(g:Function):Function {
          return g(g);
        })(function(h:Function):Function {
          return function():Object {
            return f(h(h)).apply(null, arguments);
          }
        });
      }
      
      var factorial:Function = Y(function(recurse:Function):Function {
         return function(x:Number):Number {
           return x == 0 ? 1 : x * recurse(x - 1);
         }
      });
      
      assertThat(factorial(5), equalTo(120));
    }
  }
}