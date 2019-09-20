// Code by Sydnee Belcher
// Project 6
// CSCI 312, Section 1

#ifndef SHAPE_H
#define SHAPE_H

#include <string>
#include <iostream>
#include "point.h"

using namespace std;


class Shape{     //base class
	
	protected:     //derived classes can access these
		string color;
		string type;
		Point loc;

	public:     //availble to every function 
		Shape * next;
		Shape (string type, string color, Point loc);
		virtual void print_color (void){
			cout << "Color: " << color;
		}
		virtual double compute_volume (void) = 0;
		void print_type (void);
		void print_loc (void);
	
	
};

#endif
