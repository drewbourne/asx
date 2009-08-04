package asx.string {
  
  /**
   *
   */
  public function substitute(formatString:String, ...replacements):String {
    var autofillIndex:int = 0;
    var result:String = formatString.replace(/(?<!\\){(\d*)}/g, function(...matchData):String {
      var index:int = !empty(String(matchData[1])) ? int(matchData[1]) : autofillIndex++;
      return replacements[index] || "";
    });
    return result.replace(/\\/, '');
  }
}