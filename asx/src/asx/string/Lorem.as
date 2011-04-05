package asx.string
{
	import asx.array.compact;
	import asx.array.inject;
	import asx.array.map;
	import asx.array.random;
	import asx.array.reject;
	import asx.array.shuffle;
	import asx.fn.repeatedly;

	public class Lorem
	{
		private static const WORDS:Array = (function():Array {
			var loremIpsum:String = (<![CDATA[
alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam 
eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo aspernatur aut odit aut fugit 
sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor sit amet consectetur
adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad 
minima veniam quis nostrum exercitationem ullam corporis nemo enim ipsam voluptatem quia voluptas sit suscipit laboriosam nisi ut
aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae et 
iusto odio dignissimos ducimus qui blanditiis praesentium laudantium totam rem voluptatum deleniti atque corrupti quos dolores et 
quas molestias excepturi sint occaecati cupiditate non provident sed ut perspiciatis unde omnis iste natus error similique sunt 
in culpa qui officia deserunt mollitia animi id est laborum et dolorum fuga et harum quidem rerum facilis est et expedita 
distinctio nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo porro quisquam est qui minus id quod 
maxime placeat facere possimus omnis voluptas assumenda est omnis dolor repellendus temporibus autem quibusdam et aut consequatur 
vel illum qui dolorem eum fugiat quo voluptas nulla pariatur at vero eos et accusamus officiis debitis aut rerum necessitatibus 
saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae itaque earum rerum hic tenetur a sapiente delectus ut 
aut reiciendis voluptatibus maiores doloribus asperiores repellat
]]>).toString();
			
			var _words:Array = loremIpsum.split(/\s/g);
			_words = reject(_words, isEmptyString);
			return _words;
		})();
		
		public static function text(textLength:int = 100, truncate:Boolean = false):String 
		{
			var source:Array = shuffle(WORDS);
			var result:String = "";
			while (result.length < textLength)
			{
				result += source.pop() + " ";
			}
			result = result.slice(0, -1);
			return truncate ? result.slice(0, 255): result;
		}
		
		public static function words(wordCount:int = 3):String 
		{
			return shuffle(WORDS).slice(0, wordCount).join(' ');
		}
		
		public static function sentence(wordCount:int = 4, randomWordCount:int = 6):String 
		{
			return capitalize(words(wordCount + (Math.floor(Math.random() * randomWordCount)))) + '.';
		}
		
		public static function sentences(sentenceCount:int = 3, wordCount:int = 4):Array 
		{
			return repeatedly(sentenceCount, sentence, [wordCount]);
		}
		
		public static function paragraph(sentenceCount:int = 3, randomSentenceCount:int = 3):String 
		{
			return sentences(sentenceCount + (Math.floor(Math.random() * randomSentenceCount))).join(' ');
		}
		
		public static function paragraphs(paragraphCount:int = 3, sentenceCount:int = 3):Array 
		{
			return repeatedly(paragraphCount, paragraph, [sentenceCount]);
		}
	}
}