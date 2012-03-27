package asx.string
{
	// http://www.davekoelle.com/alphanum.html

	/**
	 * Compares
	 */
	public function compareToInNaturalOrder(a:String, b:String):int
	{
		var result:int = -1;

		while (true)
		{
			var matchA:Array = extractAlphaOrNumberGroup(a);
			var matchB:Array = extractAlphaOrNumberGroup(b);

			var chunkA:* = matchA[0];
			var chunkB:* = matchB[0];

			a = matchA[1];
			b = matchB[1];

			if (chunkA == '')
			{
				result = -1;
				break;
			}
			else if (chunkA is Number)
			{
				if (chunkB is Number)
				{
					return chunkA < chunkB ? -1 : 1;
				}
				else
				{
					return 1;
				}
			}
			else if (chunkA < chunkB)
			{
				result = -1;
				break;
			}
			else if (chunkA > chunkB)
			{
				result = 1;
				break;
			}
		} 

		return result;
	}
}

internal function extractAlphaOrNumberGroup(value:String):Array 
{
	var matchdata:Array = /([A-Za-z]+|[\d]+)/.exec(value);
	if (matchdata)
	{
		var match:* = parseInt(matchdata[0]);
		if (isNaN(match)) match = matchdata[0];
		return [match, value.slice(matchdata[0].length)];
	}
	else
	{
		return ['', ''];
	}
}
