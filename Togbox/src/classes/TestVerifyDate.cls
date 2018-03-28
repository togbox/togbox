@isTest
private class TestVerifyDate {
    @isTest static void myDateTest() {
        //definitely more than 30 days
        Date endOfMonth = VerifyDate.CheckDates(Date.newInstance(1960, 3, 17), Date.newInstance(1960, 4, 25));
        System.assertEquals(Date.newInstance(1960, 3, 31), endOfMonth);
        
    	//date within 30 days
        Date secondDate = VerifyDate.CheckDates(Date.newInstance(1960, 3, 17), Date.newInstance(1960, 4, 10));
        System.assertEquals(Date.newInstance(1960, 4, 10), secondDate);
    
    	//date2 less than date1
        Date date2 = VerifyDate.CheckDates(Date.newInstance(1960, 3, 17), Date.newInstance(1960, 2, 10));
        System.assertEquals(Date.newInstance(1960, 3, 31), date2);
        
   	//boundary condition
        Date boundaryDate = VerifyDate.CheckDates(Date.newInstance(1960, 3, 17), Date.newInstance(1960, 4, 15));
        System.assertEquals(Date.newInstance(1960, 4, 15), boundaryDate);        
        
    }    
}