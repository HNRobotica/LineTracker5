# LineTracker5
Info and the Arduino Library for LineTracker5

# How to Use
  - Hardware
    - Connect IR1-IR5 to Analog Pins
    - Connect SIG to a Digital Pin
    - Connect GND to Ground
    
  - Software
    ```
    #include <LineTracker.h>

    //LineTracker tracker(IR1, IR2, IR3, IR4, IR5, SIG, NOISE_REDUCTION[true||false]);
    LineTracker tracker(5, 6, 7, 8, 9, 10, true);

    int calib = 1000; //The calibration point, can be discovered using the Calibration sketch in the examples

    void setup() {
      Serial.begin(9600);
      tracker.begin();
    }

    void loop() {
      Serial.println(tracker.read(2)); //Get the value from sensor 2 (IR2)
      delay(1000);
    }
    ```
