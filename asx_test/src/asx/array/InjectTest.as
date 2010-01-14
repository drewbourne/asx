package asx.array
{
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class InjectTest
	{
		
		[Test]
		public function inject_withArray():void
		{
			var memo:Number = 0;
			var values:Array = [ 1, 2, 3, 4 ];
			var sum:Function = function(acc:Number, value:Number):Number
				{
					return acc + value;
				};
			
			assertThat(inject(memo, values, sum), equalTo(10));
		}
		
		[Test]
		public function inject_withListCollectionView():void
		{
			var memo:Number = 0;
			var values:ListCollectionView = new ArrayCollection([ 1, 2, 3, 4 ]);
			var sum:Function = function(acc:Number, value:Number):Number
				{
					return acc + value;
				};
			
			assertThat(inject(memo, values, sum), equalTo(10));
		}
		
		[Test]
		public function inject_withXMLList():void
		{
			var memo:Number = 0;
			var values:XML = <x>
					<value>1</value>
					<value>2</value>
					<value>3</value>
					<value>4</value>
				</x>;
			
			var sum:Function = function(acc:Number, node:XML):Number
				{
					return acc + parseInt(node.toString());
				};
			
			assertThat(inject(memo, values.children(), sum), equalTo(10));
		}
	}
}