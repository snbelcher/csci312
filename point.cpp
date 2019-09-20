// Code by Sydnee Belcher
// Project 6
// CSCI 312, Section 1

#include <iostream>
#include "shape.h"
#include "point.h"
#include <string>
#include <cmath> // for sqrt

using namespace std;


Point::Point(){
	this -> x = 0;    //if no parameters given, set them to origin 
	this -> y = 0;
	this -> z = 0; 
}

Point::Point (double x, double y, double z){
	this -> x = x;
	this -> y = y;
	this -> z = z;
}

double Point::length(){
	double len = (sqrt (pow(x,2) + pow(y,2) + pow(z,2)));
	
	
	return (len);
}

void Point::print(void){   //prints the point 
	cout << "x: "  << x << " y: " << y << " z: " << z;
}