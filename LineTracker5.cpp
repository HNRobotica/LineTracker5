/*
  Morse.cpp - Library for flashing Morse code.
  Created by David A. Mellis, November 2, 2007.
  Released into the public domain.
*/

#include "Arduino.h"
#include "LineTracker5.h"

LineTracker::LineTracker(int ir1, int ir2, int ir3, int ir4, int ir5, int sig, bool noise)
{
  _pins[0] = ir1;
  _pins[1] = ir2;
  _pins[2] = ir3;
  _pins[3] = ir4;
  _pins[4] = ir5;

  _signalpin = sig;
  _nr = noise;
  _status = false;
}

void LineTracker::begin()
{
  for (int x = 0; x < 5; x++)
  {
    pinMode(_pins[x], INPUT);
  }
  pinMode(_signalpin, OUTPUT);
  _status = true;
}

int LineTracker::read(int sensor)
{
  int _reading;
  int _nrval = 0;

  if(sensor <= 0 || sensor > 5 || !_status){
    return -1;
  }else{
      sensor--;
  }

  if(_nr){
    digitalWrite(_signalpin, LOW);
    _nrval = analogRead(_pins[sensor]);
  }

  digitalWrite(_signalpin, HIGH);
  _reading = analogRead(_pins[sensor]);

  return _reading - _nrval;
  digitalWrite(_signalpin, LOW);
}

