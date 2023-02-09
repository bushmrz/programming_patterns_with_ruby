def fun1(arr,r)
	arr1 = arr.map{|x| (x-r).abs }
	ind = arr1.index(arr1.min)
	puts "#{arr[ind]}"
	#puts "#{arr1}"
end

def find_del(x)
	arr = Array.new
 	x.downto(1){ |del|
 		if x%del == 0 then arr.append(del) end
 	}
 	return arr
end

def fun2(arr)
	arr2 = arr.map{|x| find_del(x) }
	arr2 = arr2.flatten.uniq
	puts "#{arr2}"
end


def fun3(arr)
	arr_new = arr.map{|x| } 
end
arr = [1, 0.5, 0.002, 0.08, 0.02, 0.3, 1.3]
r = 0.2001
arr1 = [4,6,8, 14, 18, 15, 20, 25]

#fun1(arr,r)
fun2(arr1)
