package asx.date {  
  
  public function beginningOfMonth(date:Date):Date {
    return new Date(date.fullYear, date.month, 1);
  } 
}
