# v11 
# 1
def method1(x)
	count_del = 0
	x.downto(1).each {
		|div| 
		if x%div == 0 && div%3 != 0
			count_del +=1
		end
	}

	puts "Count is #{count_del}"
end
 
method1(10)
