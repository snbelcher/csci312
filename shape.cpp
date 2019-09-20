// Code by Sydnee Belcher
// Project 6
// CSCI 312, Section 1

#include <string>
#include <iostream>
#include "point.h"
#include "shape.h"

using namespace std;


Shape::Shape(string type, string color, Point loc){
	
	this -> type = type;
	this -> color = color;
	this -> loc = loc;
}
	
void Shape::print_type (void)
	{cout << "Name: " << type << "\n";}
	
void Shape::print_loc (void)
	{
		cout << "location: ";
		loc.print();
		cout << "\n";
	}
	
