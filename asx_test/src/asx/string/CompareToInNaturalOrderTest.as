package asx.string
{
	import org.flexunit.assertThat;
	import org.hamcrest.collection.array;

	public class CompareToInNaturalOrderTest
	{
		private function sort(values:Array):Array 
		{
			return values.sort(compareToInNaturalOrder);
		}

		[Test]
		public function empty():void 
		{
			assertThat(sort(['', '']), array(['', '']));
		}

		[Test]
		public function identical_simple():void 
		{
			assertThat(sort(['x', 'x']), array(['x', 'x']));
		}

		[Test]
		public function identical_two_groups():void 
		{
			assertThat(sort(['x1', 'x1']), array(['x1', 'x1']));
		}

		[Test]
		public function ordered_simple():void 
		{
			assertThat(sort(['x', 'y']), array(['x', 'y']));
		}

		[Test]
		public function ordered_simple_start_backwards():void 
		{
			assertThat(sort(['y', 'x']), array(['x', 'y']));
		}

		[Test]
		public function ordered_two_groups():void 
		{
			assertThat(sort(['x1', 'x2']), array(['x1', 'x2']));
		}

		[Test]
		public function ordered_two_groups_start_backwards():void 
		{
			assertThat(sort(['x2', 'x1']), array(['x1', 'x2']));
		}

		[Test]
		public function ordered_two_groups_numeric():void 
		{
			assertThat(sort(['x100', 'x2', 'x11', 'x1']), array(['x1', 'x2', 'x11', 'x100']));
		}

		[Test]
		public function ordered_two_groups_separated():void 
		{
			assertThat(sort(['x_2', 'x_1']), array(['x_1', 'x_2']));
		}

		[Test]
		public function ordered_two_groups_separated_different_distances():void 
		{
			assertThat(sort(['x__2', 'x_1']), array(['x_1', 'x__2']));	
		}

		[Test]
		public function ordered_two_groups_separated_different_distances_swapped():void 
		{
			assertThat(sort(['x_2', 'x__1']), array(['x__1', 'x_2']));
		}

		[Test]
		public function three_groups():void 
		{
			assertThat(
				sort(['hello 2 world', 'hello world', 'hello world 2']),
				array(['hello world', 'hello world 2', 'hello 2 world']));
		}
	}
}