// Code by Sydnee Belcher
// Project 6
// CSCI 312, Section 1

#ifndef BOX_H
#define BOX_H

#include <string>
#include "shape.h"
#include "point.h"

using namespace std;


class Box : public Shape {

   private:
      double length, width, height;
      string tbcolor;  //top and bottom color, "color" is base colors
	  Point loc;  //location of cube

   public:
      Box (string type, string color, string tbcolor, double length, double width, double height, Point loc);

      void print_color (void);

      double compute_volume (void);

};

#endif
