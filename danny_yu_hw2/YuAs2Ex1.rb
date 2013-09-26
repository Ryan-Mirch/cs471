#!/usr/bin/ruby

# Danny Yu (dyu6)
# Assignment 2 - Q.6
# 9/18/13

#!/usr/bin/ruby
# Original code modified from Lab2
class Test
  # creates a text files, 
  
  Phones = File.new("PhoneOP.txt","w")
  Patterns = File.new("PatOP.txt", "w")
  
  # initialize is the constructor
   def initialize(pat, descr)
        @pat = pat  #instance varable
        @descr = descr

   end
   
   def wrtPhones(filename) 
     Phones.puts("#(@descr) in File:: #{filename} \n  Pattern:: #{@pat}\n\n" )
     Phones.puts("Ignores extra  phone numbers if more than one on one line")
     IO.foreach(filename) { |line| 
       # puts line
       # Match operator =~ returns the index of the first match :: string =~ re OR re =~ str
       if line =~ @pat
         # $2    :: receives the "second" group
         Phones.puts(" #{$1}") 
         end
     }
     Phones.close
     end

   def wrtPats(filename)
     Patterns.puts("All patterns::")
     IO.foreach(filename) { |line|
       if line =~ @pat
         Patterns.puts("$` = #{$`}")
         Patterns.puts("$& = #{$&}")
         Patterns.puts("$' = #{$'}\n")
         Patterns.puts("$~ = #{$~}")
         Patterns.puts("$1: #{$1}, $2: #{$2}, $3: #{$3}, $4: #{$4} \n\n\n")
       end
     }
     Patterns.close
   end
   
end

# Create an object which uses a user supplied RE and creates Name.txt file
 # \s space (0x20), ")" is a meta character, "\)" will match the character ")", "."&"*" are meta character
 ex = Test.new(/(\+1\s(((\([2-9][0-9][0-9]\))\s([2-9][0-9][0-9])\s\-\s([0-9]{4}))|(([2-9][0-9][0-9])\s\-\s([2-9][0-9][0-9])\s\-\s([0-9]{4}))))/, "Phone Numbers")

# read input file and write to the output files
ex.wrtPhones("PhoneIP.txt")
ex.wrtPats("PhoneIP.txt")
