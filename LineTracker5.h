#ifndef LineTracker_h
#define LineTracker_h

#include "Arduino.h"

class LineTracker
{
public:
  LineTracker(int ir1, int ir2, int ir3, int ir4, int ir5, int sig, bool noise = true);
  void begin();
  int read(int sensor);

private:
  int _pins[5];
  int _signalpin;
  bool _nr; //noise reduction
  bool _status; //false = unitialized
};

#endif
