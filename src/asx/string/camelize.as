package asx.string
{
  // FIXME use the awesomeness of the other functions, this should much shorter
  // TODO asdoc
  // TODO example
  /**
   * CamelCases
   */
  public function camelize(value:String, lowerCaseFirstWord:Boolean=false):String
  {
    //return lowerCaseFirstWord
    //  ? value.slice(0, 1).toLowerCase() + value.slice(1).replace(underScoresHyphensAndWhitespace, groupToUpperCase)
    //  : value.replace(underScoresHyphensAndWhitespace, groupToUpperCase);

    var camelized:String = value.split(underscoresHyphensAndWhitespace).map(capitalizeWord).join('');
    return lowerCaseFirstWord ? camelized.slice(0, 1).toLowerCase() + camelized.slice(1) : camelized;
  }
}

import asx.fn._;
import asx.fn.partial;
import asx.string.capitalize;

internal const underscoresHyphensAndWhitespace:RegExp = /[_-\s]+(.)/g;
internal const capitalizeWord:Function = partial(capitalize, _);
