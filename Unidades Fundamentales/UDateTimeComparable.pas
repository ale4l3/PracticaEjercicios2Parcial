unit UDateTimeComparable;
{$mode objfpc}

interface
uses SysUtils, UABBGenerico;
type

	Date = class (Comparable)
		private
			year, month, day: integer;
			
		public
			constructor create(d, m, y: integer);
			
			function getDay(): integer;
			function getMonth(): integer;
			function getYear(): integer;			
			function equals (otroComparable : comparable) : boolean; override; 
			function lessThan ( otroComparable : comparable) : boolean; override; 
			function greaterThan ( otroComparable : comparable) : boolean; override; 
			function lessThanOrEquals ( otroComparable : comparable) : boolean; override; 
			function greaterThanOrEquals ( otroComparable : comparable) : boolean; override; 			
			function toString(): ansistring; override;
	end;
	
	Time = class
		private
			hour, minutes, seconds: integer;
			
		public
			constructor create(h, m, s: integer);
			
			function getHour(): integer;
			function getMinutes(): integer;
			function getSeconds(): integer;
			function toString(): ansistring; override;
	end;	
	
implementation


    constructor Date.create(d, m, y: integer);
    begin
    year:= y; month:= m; day:= d;
    end;
    
	function Date.getDay(): integer;
	begin
	getDay:= day;
	end;
	
	function Date.getMonth(): integer;
	begin
	getMonth:= month;
	end;
	
	function Date.getYear(): integer;
	begin
	getYear:= year;
	end;
	
	function Date.toString(): ansistring;	
	begin
		toString:= IntToStr(day) + '/' + IntToStr(month) + '/' + IntToStr(year);
	end;
	
	function Date.equals (otroComparable : comparable) : boolean;
	begin
		equals := ( day = (otroComparable as date).getDay() ) and ( month = (otroComparable as date).getMonth() ) and ( year = (otroComparable as date).getyear() ) 
	end;

	function Date.lessThan (otroComparable : comparable) : boolean; 
	begin 
		lessThan := ( year < (otroComparable as date).getYear) 
		or ( (year = (otroComparable as date).getYear()) and (month < (otroComparable as date).getMonth)) 
		or ( (year = (otroComparable as date).getYear()) and (month = (otroComparable as date).getMonth) and (day < (otroComparable as date).getDay))  
	end;
	
	function Date.greaterThan (otroComparable : comparable) : boolean; 
	begin 
		greaterThan := ( year > (otroComparable as date).getYear) 
		or ( (year = (otroComparable as date).getYear()) and (month > (otroComparable as date).getMonth)) 
		or ( (year = (otroComparable as date).getYear()) and (month = (otroComparable as date).getMonth) and (day > (otroComparable as date).getDay))  
	end;
	
	function Date.lessThanOrEquals (otroComparable : comparable) : boolean; 
	begin 
		lessThanOrEquals := ( year < (otroComparable as date).getYear) 
		or ( (year = (otroComparable as date).getYear()) and (month < (otroComparable as date).getMonth)) 
		or ( (year = (otroComparable as date).getYear()) and (month = (otroComparable as date).getMonth) and (day <= (otroComparable as date).getDay))  
	end;
	
	function Date.greaterThanOrEquals (otroComparable : comparable) : boolean; 
	begin 
		greaterThanOrEquals := ( year > (otroComparable as date).getYear) 
		or ( (year = (otroComparable as date).getYear()) and (month > (otroComparable as date).getMonth)) 
		or ( (year = (otroComparable as date).getYear()) and (month = (otroComparable as date).getMonth) and (day >= (otroComparable as date).getDay))  
	end;
	
	
	constructor Time.create(h, m, s: integer);
    begin
    hour:= h; minutes:= m; seconds:= s;
    end;
    
	function Time.getHour(): integer;
	begin
	getHour:= hour;
	end;
	
	function Time.getMinutes(): integer;
	begin
	getMinutes:= minutes;
	end;
	
	function Time.getSeconds(): integer;
	begin
	getSeconds:= seconds;
	end;	
	
	function Time.toString(): ansistring;	
	begin
	toString:= IntToStr(hour) + ':' + IntToStr(minutes) + ':' + IntToStr(seconds);
	end;
	
	
end.
