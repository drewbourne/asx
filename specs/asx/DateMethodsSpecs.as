package asx {
  
  import spectacular.dsl.*;
  import org.hamcrest.*;

  public function DateMethodsSpecs():void {
    
    describe('DateMethods', function():void {
      
      var dateWithTime:Date;
      var date:Date;
      var datePreviousMonday:Date;
      
      before(function():void {
        // february 2nd 2008, 03.04.05.006
        dateWithTime = new Date(2008, 1, 2, 3, 4, 5, 6);
        date = new Date(2008, 1, 2, 0, 0, 0, 0);
        datePreviousMonday = new Date(2008, 1, 2);
      });
      
      describe('change', function():void {
        it('changes year', function():void {
          var expected:Date = new Date(date.time);
          expected.year = 2007;
          assertThat( DateMethods.change(date, { year: 2007 }), isEqual(expected));
        });
        it('changes month', function():void {
          assertThat( DateMethods.change(date, { month: 3 }), isEqual());
        });
        it('changes date', function():void {
          
        });
        it('changes hours', function():void {
          
        });
        it('changes minutes', function():void {
          
        });
        it('changes seconds', function():void {
          
        });
        it('changes milliseconds', function():void {
          
        });
      });
      
      describe('advance', function():void {
        it('advances years', function():void {
          assertThat( advanceDate(date, { years: 1 }), isEqual());
          assertThat( advanceDate(date, { years: -1 }), isEqual());
          assertThat( advanceDate(date, { years: 100 }), isEqual());
          assertThat( advanceDate(date, { years: -100 }), isEqual());
        });
        it('advances months', function():void {
          assertThat( advanceDate(date, { months: 1 }), isEqual());
          assertThat( advanceDate(date, { months: -1 }), isEqual());
          assertThat( advanceDate(date, { months: 100 }), isEqual());
          assertThat( advanceDate(date, { months: -100 }), isEqual());
        });
        it('advances weeks', function():void {
          assertThat( advanceDate(date, { weeks: 1 }), isEqual());
          assertThat( advanceDate(date, { weeks: -1 }), isEqual());
          assertThat( advanceDate(date, { weeks: 100 }), isEqual());
          assertThat( advanceDate(date, { weeks: -100 }), isEqual());
        });
        it('advances days', function():void {
          assertThat( advanceDate(date, { days: 1 }), isEqual());
          assertThat( advanceDate(date, { days: -1 }), isEqual());
          assertThat( advanceDate(date, { days: 100 }), isEqual());
          assertThat( advanceDate(date, { days: -100 }), isEqual());
        });
        it('advances hours', function():void {
          assertThat( advanceDate(date, { hours: 1 }), isEqual());
          assertThat( advanceDate(date, { hours: -1 }), isEqual());
          assertThat( advanceDate(date, { hours: 100 }), isEqual());
          assertThat( advanceDate(date, { hours: -100 }), isEqual());
        });
        it('advances minutes', function():void {
          assertThat( advanceDate(date, { minutes: 1 }), isEqual());
          assertThat( advanceDate(date, { minutes: -1 }), isEqual());
          assertThat( advanceDate(date, { minutes: 100 }), isEqual());
          assertThat( advanceDate(date, { minutes: -100 }), isEqual());
        });
        it('advances seconds', function():void {
          assertThat( advanceDate(date, { seconds: 1 }), isEqual());
          assertThat( advanceDate(date, { seconds: -1 }), isEqual());
          assertThat( advanceDate(date, { seconds: 100 }), isEqual());
          assertThat( advanceDate(date, { seconds: -100 }), isEqual());
        });
        it('advances milliseconds', function():void {
          assertThat( advanceDate(date, { milliseconds: 1 }), isEqual());
          assertThat( advanceDate(date, { milliseconds: -1 }), isEqual());
          assertThat( advanceDate(date, { milliseconds: 100 }), isEqual());
          assertThat( advanceDate(date, { milliseconds: -100 }), isEqual());
        });
      });
      
      describe('beginningOfDay', function():void {
        it('should return a Date at 00:00:00.000', function():void {
          assertThat( beginningOfDay(dateWithTime), isEqual(date));
        });
      });
      
      describe('beginningOfWeek', function():void {
        it('should return the beginning of the day for the previous Monday', function():void {
          assertThat( beginningOfWeek(dateWithTime), isEqual(datePreviousMonday));
        });
      });
      
      describe('beginningOfMonth', function():void {
        it('should return the first of the month', function():void {
          assertThat( beginningOfMonth(new Date(YEAR, 3, 7)), isEqual(new Date(YEAR, 3, 1)));
        });
      });
      
      describe('beginningOfQuarter', function():void {
        it('should return the first of January, April, July, October', function():void {
          assertThat( beginningOfYear(new Date(YEAR, 1, 2)), isEqual(new Date(YEAR, 0, 1, 0, 0, 0, 0)));
          assertThat( beginningOfYear(new Date(YEAR, 5, 2)), isEqual(new Date(YEAR, 3, 1, 0, 0, 0, 0)));
          assertThat( beginningOfYear(new Date(YEAR, 7, 2)), isEqual(new Date(YEAR, 6, 1, 0, 0, 0, 0)));
          assertThat( beginningOfYear(new Date(YEAR, 11, 2)), isEqual(new Date(YEAR, 9, 1, 0, 0, 0, 0)));
        });
      });
      
      describe('beginningOfYear', function():void {
        it('should return the first of January', function():void {
          assertThat( beginningOfYear(date), isEqual(new Date(YEAR, 0, 1, 0, 0, 0, 0)));
        });
      });
      
      describe('beginningOfTime', function():void {
        it('returns the epoch date', function():void {
          var epoch:Date = new Date(1970, 0, 1, 0, 0, 0, 0);
          assertThat( beginningOfTime(), isEqual(epoch) );
        });
      });
      
      describe('endOfTime', function():void {
        it('returns Tuesday, 19 January 2038 03:14:07 UTC', function():void {
          var maxDateFor32BitSystems:Date = new Date(2038, 0, 19, 3, 14, 07, 000);
          assertThat( endOfTime(), isEqual(maxDateFor32BitSystems) );
        });
      });
      
      describe('today', function():void {
        it('returns the start of today', function():void {
          var now:Date = new Date();
          assertThat( today(), isEqual(new Date(now.year, now.month, now.date, 0, 0, 0, 0)));
        });
      });
      
      describe('tomorrow', function():void {
        it('returns the start of tomorrow', function():void {
          var now:Date = new Date();
          assertThat( tomorrow(), isEqual(new Date(now.year, now.month, now.date + 1, 0, 0, 0, 0)));
        });
      });
      
      describe('yesterday', function():void {
        it('returns the start of yesterday', function():void {
          assertThat( tomorrow(), isEqual(new Date(now.year, now.month, now.date - 1, 0, 0, 0, 0)));
        });
      });
    });
  }
}
