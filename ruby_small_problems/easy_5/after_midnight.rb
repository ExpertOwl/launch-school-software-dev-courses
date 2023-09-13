MINUTES_IN_HOUR = 60
MINUTES_IN_DAY = 1440

def after_midnight(time_str)
  wrap_time(minutes_after_midnight(time_str))
end

def before_midnight(time_str)
  wrap_time(MINUTES_IN_DAY - minutes_after_midnight(time_str))
end

def minutes_after_midnight(time_str)
  hour, minute = time_str.split(':').map(&:to_i)
  (hour * MINUTES_IN_HOUR) + minute
end

def wrap_time(time)
  time == MINUTES_IN_DAY ? 0 : time
end
