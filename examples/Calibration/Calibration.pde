#include <LineTracker5.h>

//LineTracker tracker(IR1, IR2, IR3, IR4, IR5, SIG, NOISE_RED[true||false]);
LineTracker tracker(A1, A2, A3, A4, A5, 10, true);

int stage = 0;
int value[2];

void setup() {
  Serial.begin(9600);
  tracker.begin();

  Serial.println("Put all the sensors on the first color and send '0' in the Serial console");
}

void loop() {
  if(stage >= 2){
    int vals = value[0] + value[1];
    Serial.println("The calibration value is " + vals/2);
    noInterrupts();
    while(true){}
  }
  
  if (Serial.available() > 0) {
    int vals = tracker.read(1) + tracker.read(2) + tracker.read(3) + tracker.read(4) + tracker.read(5);
    value[stage] = vals / 5;
    if(stage == 1){
      Serial.println("Put all the sensors on the second color and send '0' in the Serial console");
    }
    while(Serial.available() > 0) {
      Serial.read();
    }
    stage++;
  }
  
}
