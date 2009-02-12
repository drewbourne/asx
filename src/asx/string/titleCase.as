package asx.string {  
  
  /**
   * Converts a String to title case, respecting a bunch of edge cases. 
   *  
   * Ported from David Gouch's JavaScript version of John Gruber's TitleCase
   * 
   * @see http://daringfireball.net/2008/05/title_case
   * @see http://individed.com/code/to-title-case/
   */
  public function titleCase(value:String):String {
    
    return value.replace(/([\w&`'‘’"“.@:\/\{\(\[<>_]+-? *)/g, function(match:String, p1:String, index:int, title:String):String {
        if (index > 0 && title.charAt(index - 2) !== ":" 
            && match.search(/^(a(nd?|s|t)?|b(ut|y)|en|for|i[fn]|o[fnr]|t(he|o)|vs?\.?|via)[ \-]/i) > -1) {
          return match.toLowerCase();
        }
            
        if (title.substring(index - 1, index + 1).search(/['"_{(\[]/) > -1) {
          return match.charAt(0) + match.charAt(1).toUpperCase() + match.substr(2);
        }
        if (match.substr(1).search(/[A-Z]+|&|[\w]+[._][\w]+/) > -1 
            || title.substring(index - 1, index + 1).search(/[\])}]/) > -1) {
          return match;
        }
        return match.charAt(0).toUpperCase() + match.substr(1);
    });
  } 
}
