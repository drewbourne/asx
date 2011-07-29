package asx.array
{
	import org.flexunit.assertThat;
	import org.hamcrest.collection.array;

	public class IncludeInTest
	{
		[Test]
		public function includeIn_withUniqueItemToAdd_shouldAddItemToTargetArray():void 
		{
			const existingItem:Object = {};
			const target:Array = [existingItem];
			const itemToAdd:Object = {};
			
			const result:Array = includeIn(target, itemToAdd);
			
			assertThat(result, array(existingItem, itemToAdd));
		}
		
		[Test]
		public function includeIn_withDuplicateItemToAdd_shouldAddNotAddItemToTargetArray():void 
		{
			const existingItem:Object = {};
			const target:Array = [existingItem];
			const itemToAdd:Object = existingItem;
			
			const result:Array = includeIn(target, itemToAdd);
			
			assertThat(result, array(existingItem));	
		}
	}
}