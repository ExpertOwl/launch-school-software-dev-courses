=begin
Problem Given a angle in degrees, convert it to DMS

  Input: Float representing an angle

  Output: String representing same angle in DMG


  Explicit:  Min and sec should be formatted with two zeros
              Degree should be formatted w/ constant provided
              Number will always be provided

  Implicit: Use ' and " for min and sec


  Edge cases: Formatting
              Zero or 360 deg
              Zero minutes but some seconds
              Zero degree but has m/s value
              Small values which get rounded down

Example:
  1 -> 1
  1.1 -> 1d06m
  1.001 -> 1d0m6s

Data strucutre
  buld result as list of integers. then at the end, join to string.  keep angle as running total

Algorithm

  Start:

  Get degrees
    Take whole part of number, that is the degree value. Append degree value to string with symbol
    Subtract that int from float
  Get minutes
    Multiply result by 60 and take the whole number part
    That is the seconds. Format to two decimal places, append to list
    subtract int from float and continue to seconds
  Get seconds
    Multiply result by 60 and take the whole number part
    That is the seconds.  append to list

    To convert:
      Whole number part is the same
      take the decimal part and multuply by 60
      take whole part of result, those are the minutes
      multiply remander by 60, those are the seconds.  append to list

    format
    use formatted string to format answer and round to two demical places

C
=end
DEGREE = "\xC2\xB0"
MIN_PER_DEG = 60
SEC_PER_MIN = 60

def split_float(float)
  float.divmod(1)
end

def dms(angle)
  angle %= 360
  deg, decmial = split_float(angle)
  minutes = decmial * MIN_PER_DEG
  _min, decmial = split_float(minutes)
  seconds = decmial * SEC_PER_MIN
  format_output(deg, minutes, seconds)
end

def format_output(deg, minutes, seconds)
  "#{deg}#{DEGREE}#{format('%02d', minutes)}'#{format('%02d', seconds)}\""
end

p dms(121.135)
p dms(76.73) == %(76°43'48")
p dms(254.6) #== %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(30) == %(30°00'00")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")