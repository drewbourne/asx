package asx {

  import asx.array.eachSlice;
  import asx.string.*;
  import spectacular.dsl.*;
  import org.hamcrest.*;
  import org.hamcrest.core.*;
  import org.hamcrest.object.*;

  public function StringSpecs():void {

    describe('asx.string', function():void {
      describe('empty', function():void {
        it('returns true for null', function():void {
          assertThat(empty(null), equalTo(true));
        });
        it('returns true for zero length string ""', function():void {
          assertThat(empty(""), equalTo(true));
        });
        it('returns true for whitespace only string "\\t\\n\\r "', function():void {
          assertThat(empty(" "), equalTo(true));
          assertThat(empty("\t"), equalTo(true));
          assertThat(empty("\r"), equalTo(true));
          assertThat(empty("\n"), equalTo(true));
          assertThat(empty("\t\n\r "), equalTo(true));
        });
        it('returns false for "stringwithoutwhitespace"', function():void {
          assertThat(empty("stringwithoutwhitespace"), equalTo(false));
        });
        it('returns false for "string\t with\r\n whitespace"', function():void {
          assertThat(empty("string\t with\r\n whitespace"), equalTo(false));
        });
      });
      
      describe('substitute', function():void {
        it('replaces indexed markers {0} {1} in-order', function():void {
          assertThat(substitute("in-order {0} {1}", 1, 2), equalTo('in-order 1 2'));
        });
        it('replaces indexed markers {0} {1} out-of-order', function():void {
          assertThat(substitute("out-of-order {1} {0}", 1, 2), equalTo('out-of-order 2 1'));
        });
        it('discards unused parameters', function():void {
          assertThat(substitute("used {2} and {3}", 1, 2, 3, 4), equalTo('used 3 and 4'));
          assertThat(substitute("didnt discard {0} or {1}", 1, 2, 3, 4), equalTo('didnt discard 1 or 2'));
        });
        it('replaces autofill markers {} {}', function():void {
          assertThat(substitute("autofills {} markers {}", 1, 2, 3, 4), equalTo('autofills 1 markers 2'));
        });
        it('mixed autofill and indexed markers', function():void {
          assertThat(substitute("mixed {} {} {0} {}", 1, 2, 3, 4), equalTo("mixed 1 2 1 3"));
          assertThat(substitute("mixed autofill {} and index {3} markers", 1, 2, 3, 4), equalTo('mixed autofill 1 and index 4 markers'));
        });
        it('skips unmatched braces', function():void {
          assertThat(substitute("left { only", 1), equalTo("left { only"));
          assertThat(substitute("right } only", 1), equalTo("right } only"));
          assertThat(substitute("left { only", 1), equalTo("left { only"));
          assertThat(substitute("with {words}", 1), equalTo("with {words}"));
        });
        it('ignores escaped markers', function():void {
          // escape the slash so it stays in the string
          // if you want the slash then i think you are probably out of luck
          // with the current implementation.
          // ask nicely for a fix, or provide a patch. please. 
          // kthx.
          assertThat(substitute("with \\{1} escape", 1, 2), equalTo("with {1} escape"));
          
        });
      });
      
      describe('reverse', function():void {
        it('reverses the string', function():void {
          assertThat(reverse("string"), equalTo("gnirts"));
        });
      });
      
      describe('repeat', function():void {
        it('repeats the given string the given number of times', function():void {
          assertThat(repeat('', 0), equalTo(''));
          assertThat(repeat('', 1), equalTo(''));
          assertThat(repeat(' ', 0), equalTo(''));
          assertThat(repeat(' ', 1), equalTo(' '));
          assertThat(repeat(' ', 2), equalTo('  '));
          assertThat(repeat('-+', 2), equalTo('-+-+'));
        });
      });
  
      describe('padStart', function():void {
        it('adds the specified amount of padding from the pad string to the left side of the given value string', function():void {
          assertThat(padStart('hello', 10), equalTo('     hello'));
          assertThat(padStart('hello', 10, '-+('), equalTo('+(-+(hello'));
        });
      });
  
      describe('padEnd', function():void {
        it('adds the specified amount of padding from the pad string to the right side of the given value string', function():void {
          assertThat(padEnd('hello', 10), equalTo('hello     '));
          assertThat(padEnd('hello', 10, ')+-'), equalTo('hello)+-)+'));
        });
      });
      
      describe('trim', function():void {
        it('removes whitespace characters from the start and end of the given string', function():void {
          assertThat(trim('  start only'), equalTo('start only'));
          assertThat(trim('end only '), equalTo('end only'));
          assertThat(trim('   both    '), equalTo('both'));
        });
      });
      
      describe('trimStart', function():void { 
        it('removes whitespace characters from the start of the given string', function():void {
          assertThat(trimStart('  start only'), equalTo('start only'));
          assertThat(trimStart('end only '), equalTo('end only '));
          assertThat(trimStart('   both    '), equalTo('both    '));
        });
      });
      
      describe('trimEnd', function():void {
        it('removes whitespace characters from the end of the given string', function():void {
          assertThat(trimEnd('  start only'), equalTo('  start only'));
          assertThat(trimEnd('end only '), equalTo('end only'));
          assertThat(trimEnd('   both    '), equalTo('   both'));
        });
      });
      
      describe('normalize', function():void {
        it('trims the string', function():void {
          assertThat(normalize('  hello '), equalTo('hello'));
        });
        it('replaces sequences of whitespace with a single space', function():void {
          assertThat(normalize('k thx bye'), equalTo('k thx bye'));
          assertThat(normalize('k   thx bye'), equalTo('k thx bye'));
          assertThat(normalize('k\tthx\nbye'), equalTo('k thx bye'));
          assertThat(normalize('k \t thx\n\n\tbye'), equalTo('k thx bye'));
        });
      });
      
      describe('capitalize', function():void {
        it('is naïve, use titleCase instead');
        it('Uppercases the first character of a string and leaves the rest unaltered', function():void {
          assertThat(capitalize('waffles'), equalTo('Waffles'));
          assertThat(capitalize('iPhone'), equalTo('IPhone'));
          assertThat(capitalize('multiple words'), equalTo('Multiple words'));
        });
      });
      
      describe('titleCase', function():void {
        it("matches Gruber's ideal titles", function():void {
          var titles:Array = [
            "For step-by-step directions email someone@gmail.com",
            "For Step-by-Step Directions Email someone@gmail.com",

            "2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'",
            "2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'",

            'Have you read “The Lottery”?',
            'Have You Read “The Lottery”?',

            'your hair[cut] looks (nice)',
            'Your Hair[cut] Looks (Nice)',

            "People probably won't put http://foo.com/bar/ in titles",
            "People Probably Won't Put http://foo.com/bar/ in Titles",

            "Scott Moritz and TheStreet.com’s million iPhone la‑la land",
            "Scott Moritz and TheStreet.com’s Million iPhone La‑La Land",

            "BlackBerry vs. iPhone",
            "BlackBerry vs. iPhone",

            "Notes and observations regarding Apple’s announcements from ‘The Beat Goes On’ special event",
            "Notes and Observations Regarding Apple’s Announcements From ‘The Beat Goes On’ Special Event",

            "Read markdown_rules.txt to find out how _underscores around words_ will be interpretted",
            "Read markdown_rules.txt to Find Out How _Underscores Around Words_ Will Be Interpretted",

            "Q&A with Steve Jobs: 'That's what happens in technology'",
            "Q&A With Steve Jobs: 'That's What Happens in Technology'",

            "What is AT&T's problem?",
            "What Is AT&T's Problem?",

            "Apple deal with AT&T falls through",
            "Apple Deal With AT&T Falls Through",

            "this v that",
            "This v That",

            "this vs that",
            "This vs That",

            "this v. that",
            "This v. That",

            "this vs. that",
            "This vs. That",

            "The SEC's Apple probe: what you need to know",
            "The SEC's Apple Probe: What You Need to Know",

            "'by the way, small word at the start but within quotes.'",
            "'By the Way, Small Word at the Start but Within Quotes.'",

            "Small word at end is nothing to be afraid of",
            "Small Word at End Is Nothing to Be Afraid Of",

            "Starting sub-phrase with a small word: a trick, perhaps?",
            "Starting Sub-Phrase With a Small Word: A Trick, Perhaps?",

            "Sub-phrase with a small word in quotes: 'a trick, perhaps?'",
            "Sub-Phrase With a Small Word in Quotes: 'A Trick, Perhaps?'",

            'Sub-phrase with a small word in quotes: "a trick, perhaps?"',
            'Sub-Phrase With a Small Word in Quotes: "A Trick, Perhaps?"',

            '"Nothing to Be Afraid of?"',
            '"Nothing to Be Afraid Of?"',

            'a thing',
            'A Thing',

            "Dr. Strangelove (or: how I Learned to Stop Worrying and Love the Bomb)",
            "Dr. Strangelove (Or: How I Learned to Stop Worrying and Love the Bomb)"
          ];
          
          eachSlice(titles, 2, function(slice:Array, i:int, a:Array):void {
            assertThat(titleCase(slice[0]), equalTo(slice[1]))
          });
        });
      });
    });
    
  }
}
