// Code by Sydnee Belcher
// Project 6
// CSCI 312, Section 1
// Project description: To create a series of header files and .cpp files where we 
// a shape class and then create derived classes of that shape class.  

#include <stdio.h>
#include "cone.h"
#include "sphere.h"
#include "box.h"
#include "shape.h"
#include "point.h"
#include <string.h>

using namespace std;

void read_objs (Shape **list)
{
	Shape *node;         // variable used to create a new node each time through the loop
	double x, y, z, xx, yy, zz, rad; // temporary variables used to read in values; fill in the rest
	string type, color, color2;     // temporary variables used to read in values; fill in the rest

	// initialize list
	*list = NULL;

	while (cin >> type) {

		if (type.compare ("sphere") == 0) {

			cin >> x >> y >> z >> rad >> color; 
			
			node = new Sphere(type, color, Point(x, y, z), rad);
		}

		else if (type.compare ("box") == 0) {
			
			cin >> x >> y >> z >> xx >> yy >> zz >> color >> color2;
			
			node = new Box (type, color, color2, x, y, z, Point(xx, yy, zz));
		}
   
		else if (type.compare ("cone") == 0) {

			cin >> x >> y >> z >> xx >> yy >> zz >> rad >> color >> color2;

			node = new Cone (type, color, color2, Point (x, y, z), Point (xx, yy, zz), rad);
		}

		node -> next = *list;
		*list = node;

	}
}


void print_objs (Shape *list){ //loop to get thru all the linked list items
	
	Shape *cur = list;
	
	while (cur != NULL){
	    
	cur -> print_type();
	cur -> print_color();
	cur -> print_loc();
	cout << cur -> compute_volume() << "\n";
	cout << "\n";
	
	cur = cur -> next;
	
	}
}


int main()
{ 	
	Shape *list;
	read_objs (&list);
	print_objs (list);
	
    Shape *tmp = list;
    
    while (list != NULL)  //loop to return any allocated space to system
    {
        tmp = list;
        list = list -> next;
        delete tmp;
    } 

    return 0;
}
