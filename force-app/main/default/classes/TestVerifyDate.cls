@isTest
private class TestVerifyDate {
    @isTest static void testWithin30DayTrue(){
        Date startDate = Date.newInstance(1999, 12, 2);
        Date upcomingDate = VerifyDate.CheckDates(startDate, startDate.addDays(29));
        
        System.assertEquals(startDate.addDays(29), upcomingDate);
    }
    
    @isTest static void testDateMoreThan30Days(){
        Date startDate = Date.newInstance(1999, 12, 2);
        Date upcomingDate = VerifyDate.CheckDates(startDate, startDate.addDays(31));
        
        System.assertEquals(Date.newInstance(1999, 12, 31), upcomingDate);
    }
    
    
    @isTest static void testDayInPast(){
        Date pastDate = Date.newInstance(1999, 12, 2);
        Date upcomingDate = VerifyDate.CheckDates(pastDate.addDays(5), pastDate);
            
        System.assertEquals(Date.newInstance(1999, 12, 31), upcomingDate);
    }
}