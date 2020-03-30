//Isaac Seemann
//3-20-2020
//
//This class operates with basic funcationality of a Car.
//You can buy (instaciate) a new or used car. New cars are bought by default.
//Buying a used car requires a starting X,Y position and odometer value.
//Car can drive to any X,Y location that is within the straight-line range of current fuel.
//User can check the Trip Counter and reset it.
//User can check stats of the car which includes, current location (X,Y), fuel level,
//odometer, and max distance that could be drive based on existing fuel level and fixed MPG.
public class Car {
    
    private final Integer DEFAULT_FUEL_CAPACITY = 10;
    private final Integer DEFAULT_MPG = 30;
    private Decimal fuelTank;
    private Integer posX;
    private Integer posY;
    private Decimal odometer;
    private Decimal tripCounter;
    //Car constructor for brand new car
    public Car() {
        this.fuelTank = DEFAULT_FUEL_CAPACITY;
        this.posX = 0;
        this.posY = 0;
        this.odometer = 0;
        this.tripCounter = 0;
    }
    //Car constructor for used car
    public Car(Integer startPosX, Integer startPosY, double exitingOdometer) {
        this.fuelTank = DEFAULT_FUEL_CAPACITY;
        this.posX = startPosX;
        this.posY = startPosY;
        this.odometer = exitingOdometer;
        this.tripCounter = 0;
    }
    //Request Car to drive to target location coordinates. If Car doesn't have enough fuel/range, request is 
    //rejected with error feedback
    public String driveTo(Integer destinationPosX, Integer destinationPosY){
        
        Decimal tripDist = calcTravelDist(destinationPosX,destinationPosY);
        String message;
        
        if(tripDist<=calcMaxDistance()) {
            this.posX = destinationPosX;
            this.posY = destinationPosY;
            this.fuelTank -= calcFuelUsed(tripDist);
            this.odometer += tripDist;
            this.tripCounter += tripDist;
            message = 'You drove '+tripDist.setScale(1)+' miles to your destination';
        } else {
            
            message = 'You don\'t have enough gas to drive to '+ destinationPosX+','+destinationPosY+
                ', '+tripDist.setScale(1)+' miles away.';
        }
        
        return message;
    }
    //top off fuel tank
    public void refuel() {
        this.fuelTank = DEFAULT_FUEL_CAPACITY;
    }
    //push trip reset button
    public String resetTrip() {
        this.tripCounter = 0;
        return 'Your trip counter has been reset to 0';
    }
    //Check how many miles have been traveled since last counter reset
    public String checkTripCounter() {
        String message = 'Your trip counter is at '+this.tripCounter.setScale(1)+' miles';
        return message;
    }
    //Check fuel gauge percentage "on dash"
    public String checkFuelGauge() {
        String message = 'Your fuel is at '+(checkFuelLevel() * 100).setScale(0)+'%';
        return message;
    }
    //helper method to determine total fuel used for a given trip distance
    private Decimal calcFuelUsed(Decimal tripDist) {
        
        return tripDist / DEFAULT_MPG;
    }
    //print status of car's position, percent of fuel left(fuel gauge) and remaining range
    public String getStatus() {
        
        String message = 'You\'re currently at: '+this.posX+','+this.posY+
            '\nCurrent fuel level: '+Math.round(checkFuelLevel()*100)+'%'+
            '\nYou can travel a maximum of '+calcMaxDistance().setScale(1)+' miles with your current fuel level'+
            '\nOdometer: '+this.odometer.setScale(1)+' miles';
        return message;
    }
    //helper method to determine remaining fuel level as a decimal percent
    private Decimal checkFuelLevel() {
        return this.fuelTank/(Decimal)DEFAULT_FUEL_CAPACITY;
    }
    //helper method to determine max distance Car can drive with current fuel level
    private Decimal calcMaxDistance() {
        return this.fuelTank * DEFAULT_MPG;
    }
    //Calculate straight line distance between Car's current location and end location
    private Decimal calcTravelDist(Integer destinationPosX, Integer destinationPosY) {
        //pythagorean theorem
        return Math.sqrt(Math.pow(destinationPosX - this.posX, 2) +  
                         Math.pow(destinationPosY - this.posY, 2) * 1.0);
        
    }
    
    /*private static Decimal calcDistance(Integer startPosX, Integer startPosY,
Integer destinationPosX, Integer destinationPosY) {

return Math.sqrt(Math.pow(destinationPosX - startPosX, 2) +  
Math.pow(destinationPosY - startPosY, 2) * 1.0);

}*/
}