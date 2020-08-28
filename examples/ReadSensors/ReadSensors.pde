#include <LineTracker.h>

//LineTracker tracker(IR1, IR2, IR3, IR4, IR5, SIG, NOISE_RED[true||false]);
LineTracker tracker(5, 6, 7, 8, 9, 10, true);

int calib = 1000; //calibration point between the line color and the background color

void setup() {
  Serial.begin(9600);
  tracker.begin();
}

void loop() {
  Serial.println(tracker.read(2));
  delay(1000);
}
