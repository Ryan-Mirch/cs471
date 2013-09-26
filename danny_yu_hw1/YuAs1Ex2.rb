#!/usr/bin/ruby

# YuAs1Ex2.rb - Answer 1
# Author: Yu, Danny (dyu6)
# Date: 9/9/13

def powerR(pow, base)
    if pow == 0
      1
    else
      base * powerR(pow-1, base)
    end
end


#puts powerR(6,2)
