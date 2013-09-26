#!/usr/bin/ruby

# YuAs1Ex5.rb - Answer 8
# Author: Yu, Danny (dyu6)
# Date: 9/5/13

def ack(m,n)
  if m == 0
    n+1
  elsif n == 0
    ack(m-1,1)
  else
    ack(m-1, ack(m,n-1))
  end
end

#puts ack(1,0)
#puts ack(0,3)
#puts ack(1,2)
#puts ack(2,1)

10.times do |x|
  ack(3,x)
  puts x
end
