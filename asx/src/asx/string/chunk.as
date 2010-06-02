package asx.string
{
	/**
	 * Split a string into chunks of set size or possibly smaller for the last chunk.
	 *
	 * @param value The String to chunk
	 * @param chunkSize The size of chunks
	 * @param specificChunk A specific chunk to extract if any
	 * @return An Array of String chunks
	 */	
	public function chunk( value:String, chunkSize:int, specificChunk:int = -1 ):Array
	{
		var chunks:Array = [];
		
		if( chunkSize < 1 ) chunkSize = 1;
		
		if( specificChunk != -1 )
		{
			var offset:int = chunkSize * specificChunk;
			
			return value.length > offset ? [ value.substr( offset, offset + chunkSize ) ] : [];
		}
		
		for( var i:int = 0, n:int = Math.ceil(value.length / chunkSize); i < n; i++ )
		{
			chunks.push( value.slice( (i * chunkSize), (i + 1) * chunkSize ) );
		}
		
		return chunks;
	}
}