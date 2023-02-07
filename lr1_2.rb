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

# 3 
def gcd(del, x)
	if (x == 0)
		return del
	end 
	return gcd(x, del % x)
end	

def method3(num)
	sum = 0
	sum_dig = 0
	mean_dig = 1

	num.digits.each {
		|dig|
		sum_dig+=dig
		mean_dig*=dig
	}

	num.downto(1).each {
		|del|
		if num%del == 0 && gcd(del, sum_dig) == 1 && (gcd(del, mean_dig)) != 1
		sum+=del 
		end
	}

	puts "Sum is #{sum}"
end

method3(175)
