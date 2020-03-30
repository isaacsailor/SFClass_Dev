//Isaac Seemann
//3-20-2020
//
//Test class for Car.apxc with 100% code coverage.
@isTest
public class TestCar {

    @isTest
    static void TestNewCar(){
        Car testCar = new Car();
        System.assertEquals('You\'re currently at: 0,0'+
            '\nCurrent fuel level: 100%'+
            '\nYou can travel a maximum of 300.0 miles with your current fuel level'+
            '\nOdometer: 0.0 miles',testCar.getStatus());
    }
    @isTest
    static void TestUsedCar(){
        Car testUsedCar = new Car(100,50,20000);
        System.assertEquals('You\'re currently at: 100,50'+
            '\nCurrent fuel level: 100%'+
            '\nYou can travel a maximum of 300.0 miles with your current fuel level'+
            '\nOdometer: 20000.0 miles',testUsedCar.getStatus());
    }
    @isTest
    static void TestDriveInRange(){
        Car testCar = new Car();
        System.assertEquals('You drove 300.0 miles to your destination', testCar.driveTo(0, 300));
    }
    @isTest
    static void TestDriveOutOfRange(){
        Car testCar = new Car();
        System.assertEquals('You don\'t have enough gas to drive to 0,400, 400.0 miles away.', testCar.driveTo(0, 400));
    }
    @isTest
    static void TestTripCounter(){
        Car testCar = new Car();
        testCar.driveTo(0, 200);
        System.assertEquals('Your trip counter is at 200.0 miles', testCar.checkTripCounter());
        System.assertEquals('Your trip counter has been reset to 0', testCar.resetTrip());
        System.assertEquals('Your trip counter is at 0.0 miles', testCar.checkTripCounter());
    }
    @isTest
    static void TestFuelGauge(){
        Car testCar = new Car();
        testCar.driveTo(0, 150);
        System.assertEquals('Your fuel is at 50%', testCar.checkFuelGauge());
        testCar.refuel();
        System.assertEquals('Your fuel is at 100%', testCar.checkFuelGauge());
    }
        
}