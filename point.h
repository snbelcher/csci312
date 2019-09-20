// Code by Sydnee Belcher
// Project 6
// CSCI 312, Section 1

#ifndef POINT_H
#define POINT_H

#include <string>
#include <cmath> // for sqrt
#include <set>

using namespace std;


class Point {

	private:
		double x, y, z;

	public:
		Point ();
		Point (double x, double y, double z); //two constructors
	
		inline void set1 (double x, double y, double z){
			set<double> newset;
			newset.insert(x);
			newset.insert(y);
			newset.insert(z); 
		}
	
		double length ();	
	
		Point operator-(Point &p){
			Point tmp;
			tmp.x = this -> x - p.x;
			tmp.y = this -> y - p.y;
			tmp.z = this -> z - p.z;
			return tmp;
			
		}
	
		void print (void);
};

#endif
