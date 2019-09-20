(*Project 4
  Program by Sydnee Belcher
  Due date: 3/15/2019
  Class: CS 312, Section 01
  Project Description: write a program in pascal that works with dates and uses the given procedures and functions included in the specifications*)

program dt;

uses sysutils;

//main:
type
	day_range = 1..31; 
	month_range = 1..12; 
	date_t = record
			day : day_range;
			month : month_range;
			year : integer;
			end;
			

	procedure init_date(var dt : date_t; day : day_range; month : month_range; year : integer); // initializes date with day, month, and year parameters
		
		begin
			dt.day := day;
			dt.month := month;
			dt.year := year;
		end;
	

	
	procedure init_date1 (var dt : date_t);  //pass in some kind of date record and it sets it to today's date
		
		var
			month, day, year : word;
		
		begin
			DeCodeDate (Date, year, month, day);  //first Date is actually a function
			
			dt.year := year;
			dt.month := month;
			dt.day := day;
		end;	
	

	
	function date_equal (date1 : date_t; date2 : date_t) : boolean; //compares two dates and returns true if they're equal; otherwise returns false
	
		begin
			if ((date1.year = date2.year) and (date1.month = date2.month) and (date1.day = date2.day)) then
				date_equal := true
			else
				date_equal := false;
		end;



	function date_less_than(date1 : date_t; date2 : date_t) : boolean; //compares two dates and returns true if date1 is less than date2; otherwise returns false
		
		begin
			if (date1.year < date2.year) then    
				date_less_than := true
				
			else if (date1.year = date2.year) and (date1.month > date2.month) then
				date_less_than := true
				
			else if (date1.year = date2.year) and (date1.month = date2.month) and (date1.day < date2.day) then
				date_less_than := true	
			
			else
				date_less_than := false;
		end;



	function month_str (month : month_range) : string; //returns string name corresponding to month number
		
		var
			name: string;
		
		begin
			case(month) of
				1  : name := 'January';
				2  : name := 'February';
				3  : name := 'March';
				4  : name := 'April';
				5  : name := 'May';
				6  : name := 'June';
				7  : name := 'July';
				8  : name := 'August';
				9  : name := 'September';
				10 : name := 'October';
				11 : name := 'November';
				12 : name := 'December';
			end;
			
			month_str := name;			
		end;	

		

	procedure format_date (date : date_t; var ret_str : string); //formats a date into a 'month day, year' format (like march 5, 2018)

		var
			daystr : string;     //tmps to hold strings
			yearstr : string;

		begin
			str(date.day, daystr);    //convert to strings
			str(date.year, yearstr);
			
			ret_str := (month_str(date.month) + ' ' + daystr + ', ' + yearstr);   //string concatination for date format
		end;

		

	procedure next_day (var date : date_t); //increments the current day by one
		
		var
			cur_day_range : integer;

		function leap_year (year : integer) : boolean; //returns true if leap year
			begin
				if (year mod 4 = 0) then                         //***************look at this algorithim a bit more
					begin
						if (year mod 100 = 0) then
							begin
								if(year mod 400 = 0) then
									leap_year := true
								
								else
									leap_year := false
							end
							
						else
							leap_year := true
						
					end
				else
					leap_year := false;
			end;
		
		
		function month_length (month: month_range; leap: boolean): day_range; //returns number of days in month
			begin
				case(month) of
					1, 3, 5, 7, 8, 10, 12 : cur_day_range := 31;
					4, 6, 9, 11 : cur_day_range := 30;
					2 : begin
							if (leap = true) then
								cur_day_range := 29
							else
								cur_day_range := 28;
						end;
				end;
			
				month_length := cur_day_range;		
			end;	
		
		
		begin //next_day body
					
			if (date.day + 1 <= month_length(date.month, leap_year(date.year))) then   //add day if not at month's day limit
				date.day += 1
				
			else if (date.day + 1 > month_length(date.month, leap_year(date.year))) then  //if at month's day limit, we have more to do
				begin
					if (date.month = 12) then    //if december 31st, then next day is January 1st of next year
						begin
							date.month := 1;
							date.day := 1;
							date.year += 1;
						end
					else                         //else just increment month and set day back to the 1st
						begin
							date.month += 1;
							date.day := 1;
						end;
				end;
		end;


		
	var   //main body variables
		d1, d2, d3 : date_t;
		format_str : string;

	begin //Main body
		
		init_date1(d1);
		format_date(d1, format_str); 
		writeln('d1: ' + format_str);

		
		init_date(d2, 30, 12, 1999);
		format_date(d2, format_str);
		writeln('d2: ' + format_str);
		
		
		init_date(d3, 1, 1, 2000);
		format_date(d3, format_str);
		writeln('d3: ' + format_str);

		writeln;
		
		writeln('d1 < d2? ', date_less_than(d1, d2));
		writeln('d2 < d3? ', date_less_than(d2, d3));
		
		writeln;
		
		next_day(d2);
		format_date(d2, format_str);
		writeln('next day d2: ' + format_str);
		
		
		writeln('d2 < d3? ', date_less_than(d2, d3));
		writeln('d2 = d3? ', date_equal(d2, d3));
		writeln('d2 > d3? ', date_less_than(d3, d2));
		
		writeln;
		
		next_day(d2);
		format_date(d2, format_str);
		writeln('next day d2: ' + format_str);
		writeln('d2 = d3? ', date_equal(d2, d3));
		
		writeln;
		
		init_date(d1, 28, 2, 1529);
		format_date(d1, format_str);
		writeln('initialized d1 to ' + format_str);
		next_day(d1);
		format_date(d1, format_str);
		writeln('next day d1: ' + format_str);
		
		writeln;
		
		init_date(d1, 28, 2, 1460);
		format_date(d1, format_str);
		writeln('initialized d1 to ' + format_str);
		next_day(d1);
		format_date(d1, format_str);
		writeln('next day d1: ' + format_str);
		
		writeln;
		
		init_date(d1, 28, 2, 1700);
		format_date(d1, format_str);
		writeln('initialized d1 to ' + format_str);
		next_day(d1);
		format_date(d1, format_str);
		writeln('next day d1: ' + format_str);
		
		writeln;
		
		init_date(d1, 28, 2, 1600);
		format_date(d1, format_str);
		writeln('initialized d1 to ' + format_str);
		next_day(d1);
		format_date(d1, format_str);
		writeln('next day d1: ' + format_str);
		
	end.	
	
	
	

	