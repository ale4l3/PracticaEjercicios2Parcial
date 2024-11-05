unit UDateTime;
{$mode objfpc}

interface
uses SysUtils;
type

	Date = class
		private
			year, month, day: integer;
			
		public
			constructor create(d, m, y: integer);
			
			function getDay(): integer;
			function getMonth(): integer;
			function getYear(): integer;			
			function toString(): ansistring; override;
			function equals(d: date): boolean; reintroduce;
			function greaterThan(d: date): boolean;
			function lessThan(d: date): boolean;
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
	
	function date.Equals(d: date): boolean;
	begin
		if (self.getyear() = d.getyear()) and (self.getmonth() = d.getmonth()) and (self.getday() = d.getday()) then
			Equals:= true
		else
			equals:= false;
	end;
	
	function date.GreaterThan(d: date): boolean;
	begin
		if self.getyear() > d.getyear() then
			GreaterThan:= true
			else
			if self.getyear() = d.getyear() then
			begin
				if self.getmonth() > d.getmonth() then
				GreaterThan:= true
				else
				if (self.getmonth() = d.getmonth()) and (self.getday() > d.getday()) then
					GreaterThan:= true
		end
		else
			GreaterThan:= false;
	end;
	
	function date.lessThan(d: date): boolean;
	begin
		if self.getyear() < d.getyear() then
			lessThan:= true
			else
			if self.getyear() = d.getyear() then
			begin
				if self.getmonth() < d.getmonth() then
				lessThan:= true
				else
				if (self.getmonth() = d.getmonth()) and (self.getday() < d.getday()) then
					lessThan:= true
			end
		else
			lessThan:= false;
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
