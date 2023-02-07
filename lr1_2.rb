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

# 2 
def method2(num)
	min_dig = 10
	num.digits.each {
		|dig|
		if min_dig>dig && dig % 2 != 0 
			min_dig = dig 
		end
	}

	puts "Min digit is #{min_dig}"
end

method2(5423786)
