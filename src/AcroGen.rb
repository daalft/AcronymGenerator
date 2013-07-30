module Acronyms	
	class AcronymGenerator
	  
	  def initialize words, number_of_letters = 4
		@words = words
		@n = number_of_letters
	  end
	  
	  def cut array, number_of_letters 
		local_array = []
		m = number_of_letters
		array.each do |word|
		  while (m > 0)
			local_array << word[0...m]
			m -= 1
		  end
		  m = number_of_letters
		end
		local_array.uniq
	  end
		
	  def combine (threshold = 99, output = "combination.txt")
		words = []
		@words.each do |sub|
		  words << cut(sub, @n)
		end
		words.reverse!
		puts "Calculating..."
		t = Time.now
		all = words.shift()
		words.each do |w|
		  all = all.product(w)
		end
		puts "Writing..."
		File.open(output, "w+") do |f|
		  all.each do |a|
			b = a.flatten()
			f.write(stringer(b)) unless stringer(b).size > threshold
			f.write("\n")
		  end
		end
		puts "Finished. Time taken #{Time.now - t} s"
	  end
	  
	  def stringer a
		s = ""
		a.each do |b|
		  s += b
		end
		s
	  end
	end
end