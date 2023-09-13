MIN_IN_HOUR = 60
MIN_IN_DAY = 1440

def time_of_day(minutes_diff)
  minutes_diff = remove_extra_days(minutes_diff)
  formatting_dict = { hour: get_hour(minutes_diff), minute: get_minute(minutes_diff) }
  format('%<hour>02d:%<minute>02d', formatting_dict)
end

def remove_extra_days(minutes)
  minutes % MIN_IN_DAY
end

def get_hour(minutes_diff)
  (minutes_diff / MIN_IN_HOUR).floor
end

def get_minute(minutes)
  minutes % MIN_IN_HOUR
end
