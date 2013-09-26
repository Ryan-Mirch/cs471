#!/usr/bin/ruby
# sample ruby code

# RubyRE.rb - Answer 9
# Danny Yu (dyu6)
# Lab 2
# Due 9/15/13
class Test
	# creates a text files, 
	
	#     Names.txt contains the strings that match the $2 group and is the name of a function.
	  
	Names = File.new("Names.txt","w")
	
	# initialize is the constructor
   def initialize(pat, descr)
	   @pat = pat  #instance varable
	   @descr = descr

   end
   
   def wrtFile(filename) 
	   Names.print("#(@descr) in File:: #{filename} \n  Pattern:: #{@pat}\n\n" )
	   IO.foreach(filename) { |line| 
			# puts line
			# Match operator =~ returns the index of the first match :: string =~ re OR re =~ str
			if line =~ @pat
				# $2    :: receives the "second" group
				Names.print(" #{$2}")
				end
			}
			Names.close
		end
		
end

# Create an object which uses a user supplied RE and creates Name.txt file
# \s 	space (0x20), ")" is a meta character, "\)" will match the character ")", "."&"*" are meta character

# ex = Test.new( /(int)\s(.*)\(.*\)\s/ , "Names of functions" )
 ex = Test.new( /(match)\((.*)\)/ , "Arguments to match() invocations" )

# read input file and write to the output files
ex.wrtFile("Fig4_12.c")
