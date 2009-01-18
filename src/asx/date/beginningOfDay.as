package asx.date {  
  
  public function beginningOfDay(date:Date):Date {
    return changeDate(date, { hours: 0, minutes: 0, seconds: 0, ms: 0 });
  }
}