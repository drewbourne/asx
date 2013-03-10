package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class PermutateTest
	{
		[Test]
		public function permutate_returns_with_combinationsSquared_length():void {
			
			const array:Array = range(0, 3);
			
			const perm2:Array = permutate(array, 2);
			const perm3:Array = permutate(array, 3);
			
			trace(perm3);
			
			assertThat(perm2.length == Math.pow(array.length, 2));
			assertThat(perm3.length == Math.pow(array.length, 3));
		}
	}
}