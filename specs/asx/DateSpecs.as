package asx {
  
  import asx.date.*;
  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function DateSpecs():void {
    
    describe('asx.date', function():void {
      
      var dateWithTime:Date;
      var date:Date;
      var datePreviousMonday:Date;
      var expected:Date;
      
      before(function():void {
        // february 2nd 2008, 03.04.05.006
        dateWithTime = new Date(2008, 1, 2, 3, 4, 5, 6);
        date = new Date(2008, 1, 2, 0, 0, 0, 0);
        datePreviousMonday = new Date(2008, 1, 2);
      });
      
      describe('changeDate', function():void {
        before(function():void {
          expected = new Date(date.time);
        });
        
        it('changes year', function():void {
          expected.fullYear = 2007;
          assertThat( changeDate(date, { year: 2007 }), equalTo(expected));
        });
        
        it('changes month', function():void {
          expected.month = 3;
          assertThat( changeDate(date, { month: 3 }), equalTo(expected));
        });
        
        it('changes date', function():void {
          expected.month = 3;
          assertThat( changeDate(date, { date: 5 }), equalTo(expected));
        });
        
        it('changes hours', function():void {
          expected.hours = 14;
          assertThat( changeDate(date, { hours: 14 }), equalTo(expected));
        });
        
        it('changes minutes', function():void {
          expected.minutes = 15;
          assertThat( changeDate(date, { minutes: 15 }), equalTo(expected));
        });
        
        it('changes seconds', function():void {
          expected.seconds = 51;
          assertThat( changeDate(date, { seconds: 51 }), equalTo(expected));
        });
        
        it('changes milliseconds', function():void {
          expected.hours = 234;
          assertThat( changeDate(date, { ms: 234 }), equalTo(expected));
        });
      });
      
      describe('advanceDate', function():void {
        before(function():void {
          expected = new Date(date.time);
        });
        
        it('advances years forwards', function():void {
          expected = changeDate(new Date(), { year: date.fullYear + 2 });
          assertThat( advanceDate(date, { years: 2 }), equalTo(expected));
        });
          
        it('advances years backwards', function():void {
          expected = changeDate(new Date(), { year: date.fullYear - 3 });
          assertThat( advanceDate(date, { years: -3 }), equalTo(expected));
        });
        
        it('advances months forwards', function():void {
          expected = changeDate(new Date(), { month: date.month - 2 });
          assertThat( advanceDate(date, { months: 2 }), equalTo(expected));
        });
        
        it('advances months backwards', function():void {
          expected = changeDate(new Date(), { month: date.month - 3 });
          assertThat( advanceDate(date, { months: -3 }), equalTo(expected));
        });
        
        it('advances weeks forwards', function():void {
          // expected = changeDate(new Date(), { month: date.month - 3 });
          assertThat( advanceDate(date, { weeks: 1 }), equalTo(null));
        });
        
        it('advances weeks backwards', function():void {
          // expected = changeDate(new Date(), { month: date.month - 3 });
          assertThat( advanceDate(date, { weeks: -1 }), equalTo(null));
        });
        
        it('advances days', function():void {
          assertThat( advanceDate(date, { days: 1 }), equalTo(null));
          assertThat( advanceDate(date, { days: -1 }), equalTo(null));
        });
        
        it('advances hours', function():void {
          assertThat( advanceDate(date, { hours: 1 }), equalTo(null));
          assertThat( advanceDate(date, { hours: -1 }), equalTo(null));
        });
        
        it('advances minutes', function():void {
          assertThat( advanceDate(date, { minutes: 1 }), equalTo(null));
          assertThat( advanceDate(date, { minutes: -1 }), equalTo(null));
        });
        
        it('advances seconds', function():void {
          assertThat( advanceDate(date, { seconds: 1 }), equalTo(null));
          assertThat( advanceDate(date, { seconds: -1 }), equalTo(null));
        });
        
        it('advances milliseconds', function():void {
          assertThat( advanceDate(date, { milliseconds: 1 }), equalTo(null));
          assertThat( advanceDate(date, { milliseconds: -1 }), equalTo(null));
        });
      });
      
      describe('beginningOfDay', function():void {
        it('should return a Date at 00:00:00.000', function():void {
          assertThat( beginningOfDay(dateWithTime), equalTo(date));
        });
      });
      
      describe('beginningOfWeek', function():void {
        it('should return the beginning of the day for the previous Monday', function():void {
          assertThat( beginningOfWeek(dateWithTime), equalTo(datePreviousMonday));
        });
      });
      
      describe('beginningOfMonth', function():void {
        it('should return the first of the month', function():void {
          assertThat( beginningOfMonth(new Date(date.fullYear, 3, 7)), equalTo(new Date(date.fullYear, 3, 1)));
        });
      });
      
      describe('beginningOfQuarter', function():void {
        it('should return the first of January, April, July, or October', function():void {
          var year:Number = date.fullYear;
          assertThat( beginningOfYear(new Date(year, 1, 2)), equalTo(new Date(year, 0, 1, 0, 0, 0, 0)));
          assertThat( beginningOfYear(new Date(year, 5, 2)), equalTo(new Date(year, 3, 1, 0, 0, 0, 0)));
          assertThat( beginningOfYear(new Date(year, 7, 2)), equalTo(new Date(year, 6, 1, 0, 0, 0, 0)));
          assertThat( beginningOfYear(new Date(year, 11, 2)), equalTo(new Date(year, 9, 1, 0, 0, 0, 0)));
        });
      });
      
      describe('beginningOfYear', function():void {
        it('should return the first of January', function():void {
          assertThat( beginningOfYear(date), equalTo(new Date(date.fullYear, 0, 1, 0, 0, 0, 0)));
        });
      });
      
      describe('beginningOfTime', function():void {
        it('returns the epoch date', function():void {
          var epoch:Date = new Date(1970, 0, 1, 0, 0, 0, 0);
          assertThat( beginningOfTime(), equalTo(epoch) );
        });
      });
      
      describe('endOfTime', function():void {
        it('returns Tuesday, 19 January 2038 03:14:07 UTC', function():void {
          var maxDateFor32BitSystems:Date = new Date(2038, 0, 19, 3, 14, 07, 000);
          assertThat( endOfTime(), equalTo(maxDateFor32BitSystems) );
        });
      });
      
      describe('today', function():void {
        it('returns the start of today', function():void {
          assertThat( today(), equalTo(beginningOfDay(new Date())) );
        });
      });
      
      describe('tomorrow', function():void {
        it('returns the start of tomorrow', function():void {
          var now:Date = new Date();
          assertThat( today(), equalTo(advanceDate(beginningOfDay(new Date()), { days: 1 })));
        });
      });
      
      describe('yesterday', function():void {
        it('returns the start of yesterday', function():void {
          assertThat( today(), equalTo(advanceDate(beginningOfDay(new Date()), { days: -1 })));
        });
      });
    });
  }
}
