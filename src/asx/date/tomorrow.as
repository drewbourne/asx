package asx.date {  
  
  /**
   * Date for beginning of tomorrow
   */
  public function tomorrow():Date {
    return advanceDate(beginningOfDay(new Date()), { days: 1 });
  }
}
