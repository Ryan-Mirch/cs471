#!/usr/bin/env ruby

list = [ 1 ]
prod = 1
1.upto(5) do |n| prod = prod * n
  list[n] = prod
end
puts list
