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
      
      describe('changeDate', function():void {
        it('changes year', function():void {
          assertThat( changeDate() )
        });
        it('changes month', function():void {
          
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
      
      describe('advanceDate', function():void {
        it('advances years', function():void {
          assertThat( advanceDate(date, { years: 1 }), sameDate());
          assertThat( advanceDate(date, { years: -1 }), sameDate());
          assertThat( advanceDate(date, { years: 100 }), sameDate());
          assertThat( advanceDate(date, { years: -100 }), sameDate());
        });
        it('advances months', function():void {
          assertThat( advanceDate(date, { months: 1 }), sameDate());
          assertThat( advanceDate(date, { months: -1 }), sameDate());
          assertThat( advanceDate(date, { months: 100 }), sameDate());
          assertThat( advanceDate(date, { months: -100 }), sameDate());
        });
        it('advances weeks', function():void {
          assertThat( advanceDate(date, { weeks: 1 }), sameDate());
          assertThat( advanceDate(date, { weeks: -1 }), sameDate());
          assertThat( advanceDate(date, { weeks: 100 }), sameDate());
          assertThat( advanceDate(date, { weeks: -100 }), sameDate());
        });
        it('advances days', function():void {
          assertThat( advanceDate(date, { days: 1 }), sameDate());
          assertThat( advanceDate(date, { days: -1 }), sameDate());
          assertThat( advanceDate(date, { days: 100 }), sameDate());
          assertThat( advanceDate(date, { days: -100 }), sameDate());
        });
        it('advances hours', function():void {
          assertThat( advanceDate(date, { hours: 1 }), sameDate());
          assertThat( advanceDate(date, { hours: -1 }), sameDate());
          assertThat( advanceDate(date, { hours: 100 }), sameDate());
          assertThat( advanceDate(date, { hours: -100 }), sameDate());
        });
        it('advances minutes', function():void {
          assertThat( advanceDate(date, { minutes: 1 }), sameDate());
          assertThat( advanceDate(date, { minutes: -1 }), sameDate());
          assertThat( advanceDate(date, { minutes: 100 }), sameDate());
          assertThat( advanceDate(date, { minutes: -100 }), sameDate());
        });
        it('advances seconds', function():void {
          assertThat( advanceDate(date, { seconds: 1 }), sameDate());
          assertThat( advanceDate(date, { seconds: -1 }), sameDate());
          assertThat( advanceDate(date, { seconds: 100 }), sameDate());
          assertThat( advanceDate(date, { seconds: -100 }), sameDate());
        });
        it('advances milliseconds', function():void {
          assertThat( advanceDate(date, { milliseconds: 1 }), sameDate());
          assertThat( advanceDate(date, { milliseconds: -1 }), sameDate());
          assertThat( advanceDate(date, { milliseconds: 100 }), sameDate());
          assertThat( advanceDate(date, { milliseconds: -100 }), sameDate());
        });
      });
      
      describe('beginningOfDay', function():void {
        it('should return a Date at 00:00:00.000', function():void {
          assertThat( beginningOfDay(dateWithTime), sameDate(date));
        });
      });
      
      describe('beginningOfWeek', function():void {
        it('should return the beginning of the day for the previous Monday', function():void {
          assertThat( beginningOfWeek(dateWithTime), sameDate(datePreviousMonday));
        });
      });
      
      describe('beginningOfMonth', function():void {
        it('should return the first of the month', function():void {

        });
      });
      
      describe('beginningOfQuarter', function():void {
        it('should return the first of January, April, July, October', function():void {
          
        });
      });
      
      describe('beginningOfYear', function():void {
        it('should return the first of January', function():void {

        });
      });
      
      describe('beginningOfTime', function():void {
        it('returns the epoch date', function():void {
          var epoch:Date = new Date(1970, 0, 1, 0, 0, 0, 0);
          assertThat( beginningOfTime(), sameDate(epoch) );
        });
      });
      
      describe('endOfTime', function():void {
        it('returns Tuesday, 19 January 2038 03:14:07 UTC', function():void {
          var maxDateFor32BitSystems:Date = new Date(2038, 0, 19, 3, 14, 07, 000);
          assertThat( endOfTime(), sameDate(maxDateFor32BitSystems) );
        });
      });
    });
  }
}
