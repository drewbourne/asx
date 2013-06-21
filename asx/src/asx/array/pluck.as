package asx.array
{
	import asx.fn._;
	import asx.fn.partial;

    /**
     * Extracts the value of a field from every item in an Array.
     *
     * @param array <code>Array</code> to iterate over and pluck values from
     * @param field Name of the field to extract the value of, or chain of fields as String
     * @return <code>Array</code> of the the field values for every item in the source <code>Array</code>
     * @example
     * <listing version="3.0">
     *  var examples:Array = [{value:'WAFFLES'}, {value:'Crumpets'}, {value:'Toast'}];
     *  var plucked:Array = pluck(examples, 'value.toLowerCase()');
     *  assertThat(plucked, equalTo(['waffles', 'crumpets', 'toast']));
     * </listing>
     */
    public function pluck(iterable:Object, field:Object, ...args):Array
    {
        var chain:Array = field is Array ? field as Array : String(field).split('.');
        return inject(iterable, chain, partial($pluckIt, _, _, args)) as Array;
    }
}

import asx.array.map;
import asx.fn.callFunction;
import asx.fn.callProperty;
import asx.fn.getProperty;

internal function $pluckIt(iterable:Object, field:String, args:Array = null):Array
{
    var isMethod:Boolean = !!field.match(/^.+\(\)$/);
    field = isMethod ? field.slice(0, -2) : field;
    return map(iterable,
		isMethod ?
			callProperty.apply(null, [field].concat(args)) :
			getProperty(field)
	);
}

