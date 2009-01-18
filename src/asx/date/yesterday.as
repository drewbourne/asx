package asx.date {  
  
  /**
   * Date for beginning of yesterday
   */
  public function yesterday():Date {
    return advanceDate(beginningOfDay(new Date()), { days: -1 });
  }
}
