#!/usr/bin/ruby
#CS471 - Programming Language
#Section: 01
#Lab #1 due 9/1/13
#Author: Yu, Danny (dyu6)
#Date 8/29/13

def powerI(power, base)
  acc = 1
  power.times { acc *= base }
  return acc
end

#puts powerI(6,2)
