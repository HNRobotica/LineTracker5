#include <LineTracker5.h>

//LineTracker tracker(IR1, IR2, IR3, IR4, IR5, SIG, NOISE_RED[true||false]);
LineTracker tracker(A1, A2, A3, A4, A5, 10, true);

int calib = 1000; //calibration point between the line color and the background color

void setup() {
  Serial.begin(9600);
  tracker.begin();
}

void loop() {
  Serial.println(tracker.read(2));
  delay(1000);
}
