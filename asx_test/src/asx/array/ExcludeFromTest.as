package asx.array
{
	import org.flexunit.assertThat;
	import org.hamcrest.collection.array;
	import org.hamcrest.collection.emptyArray;

	public class ExcludeFromTest
	{
		[Test]
		public function excludeFrom_withMatchingItem_shouldRemoveMatchingItemFromArray():void 
		{
			const otherItem:Object = {};
			const existingItem:Object = {};
			const itemToRemove:Object = existingItem;
			const target:Array = [otherItem, existingItem];
			
			const result:Array = excludeFrom(target, itemToRemove);
			
			assertThat(result, array(otherItem));
		}
		
		[Test]
		public function excludeFrom_withMatchingItems_shouldRemoveAllMatchingItemsFromArray():void 
		{
			const otherItem:Object = {};
			const existingItem:Object = {};
			const itemToRemove:Object = existingItem;
			const target:Array = [existingItem, otherItem, existingItem];
			
			const result:Array = excludeFrom(target, itemToRemove);
			
			assertThat(result, array(otherItem));
		}
		
		[Test]
		public function excludeFrom_withNoMatchingItems_shouldReturnUnmodifiedArray():void 
		{
			const otherItem:Object = {};
			const existingItem:Object = {};
			const itemToRemove:Object = existingItem;
			const target:Array = [otherItem];
			
			const result:Array = excludeFrom(target, itemToRemove);
			
			assertThat(result, array(otherItem));
		}
	}
}