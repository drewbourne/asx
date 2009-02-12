package asx {

  import asx.array.eachSlice;
  import asx.string.*;
  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function StringSpecs():void {

    describe('asx.string', function():void {
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
