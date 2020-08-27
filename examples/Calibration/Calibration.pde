#include <LineTracker.h>

//LineTracker tracker(IR1, IR2, IR3, IR4, IR5, SIG, NOISE_RED[true||false]);
LineTracker tracker(5, 6, 7, 8, 9, 10, true);

int stage = 0;
int value[2];

void setup() {
  Serial.begin(9600);
  tracker.begin();

  Serial.println("Ponha todos os sensores na primeira cor e envie '0' no Serial");
}

void loop() {
  if(stage >= 2){
    int vals = value[0] + value[1];
    Serial.println("O valor da calibração é " + vals/2);
    noInterrupts();
    while(true){}
  }
  
  if (Serial.available() > 0) {
    int vals = tracker.read(1) + tracker.read(2) + tracker.read(3) + tracker.read(4) + tracker.read(5);
    value[stage] = vals / 5;
    if(stage == 1){
      Serial.println("Ponha todos os sensores na segunda cor e envie '0' no Serial");
    }
    while(Serial.available() > 0) {
      Serial.read();
    }
    stage++;
  }
  
}