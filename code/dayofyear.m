function doy = dayofyear(mmddyy,dateFormat)
%DAYOFYEAR Converts a date string to the day number of the year.
% 
% doy = dayofyear(daystring) returns the day of year corresponding to string 
% daystring of format "mm/dd/yyyy".
%
% doy = dayofyear(daystring,"dd/mm/yyyyy") makes this useful for everbody
% outside of the US, by interpreting the date as day first, not month
% first.

% NOTE: MATLAB already does easily this using:
%           doy = day(d,"dayofyear")
%       where d is a datetime object

% Copyright 2022 The MathWorks, Inc.

arguments
    mmddyy string;
    dateFormat (1,1) string {mustBeMember(dateFormat,["mm/dd/yyyy","dd/mm/yyyy"])} = "mm/dd/yyyy";
end

% Check that mmddyy was provided in the appropriate format
if numel(split(mmddyy,"/")) ~= 3
    error("dayofyear:InvalidDateFormat","Invalid date string. Expected date formatted as dd/mm/yyyy.")
end

% Create a datetime object depending on the dateFormat provided
if dateFormat == "mm/dd/yyyy"
    d = datetime(mmddyy,"Format","MM/dd/uuuu");
else
    d = datetime(mmddyy,"Format","dd/MM/uuuu");
end

% Initialize the days per month
daysPerMonth = [ ...
    31;  % January
    28;  % February
    31;  % March
    30;  % April
    31;  % May
    30;  % June
    31;  % July
    31;  % August
    30;  % September
    31;  % October
    30;  % November
    31]; % December

% Check for leap year
if mod(d.Year,4) == 0
    % This is a leap year, so change February to 29 days
    daysPerMonth(2) = 29;
end

% Calculate day of year
doy = sum(daysPerMonth(1:d.Month-1)) + d.Day;


end

