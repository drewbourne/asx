package asx.date {  
  
  public function beginningOfYear(date:Date):Date {
    return new Date(date.fullYear, 0, 1);
  } 
}
