package asx.date {  
  
  import asx.array.inject;
  
  /**
   * Sets fields of Date
   *  
   * @example
   * <listing version="3.0">
   *  change(new Date(), { hours: 0, minutes: 0, seconds: 0, milliseconds: 0 });
   *  change(new Date(), { hr: 0, min: 0, sec: 0, ms: 0 });
   *  change(new Date(), { year: 2010 });
   * </listing>
   */
  public function changeDate(date:Date, options:Object):Date {
    
    return inject(new Date(date.time), OPTIONS, function(date:Date, option:String):Date {
      var value:Number = options[option];
      if (value) {
        date[option] = value;
      }
      return date;
    }) as Date;
  } 
}

internal const OPTIONS:Array = [
  'time', 'year', 'month', 'date', 'hours', 'minutes', 'seconds', 'milliseconds', 'ms'
];

internal const FIELDS:Object = {
  'time': 'time',
  'year': 'fullYear', 
  'month': 'month', 
  'date': 'date',
  'hours': 'hours', 
  'minutes': 'minutes', 
  'seconds': 'seconds',
  'milliseconds': 'milliseconds',
  'ms': 'milliseconds'
};
