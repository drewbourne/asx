package asx.date {  

  import asx.array.inject;
  
  /**
   * Advances a Date by the given amount
   *  
   * @example
   * <listing version="3.0">
   *  advance(new Date(), { years: 1 });
   *  advance(new Date(), { months: -3 });
   * </listing>
   */
  public function advanceDate(date:Date, options:Object):Date {
    return inject(new Date(date.time), OPTIONS, function(date:Date, option:String):Date {
      return date;
    }) as Date;
  } 
}

internal const OPTIONS:Array = [
  'years', 'months', 'weeks', 'days', 'hours', 'minutes', 'seconds', 'milliseconds'
];
