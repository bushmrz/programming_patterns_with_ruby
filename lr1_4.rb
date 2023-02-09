# 11 59
def find_unique(arr) 
  arr = arr.sort
  if arr[0]!=arr[1] then return arr[0] else return arr[-1]
  end 
end

# 35
def nearest_el(arr,r)
	arr1 = arr.map{|x| (x-r).abs }
	ind = arr1.index(arr1.min)
	puts "#{arr[ind]}"
end

# 47
def find_del(x)
	arr = Array.new
 	x.downto(1){ |del|
 		if x%del == 0 then arr.append(del) end
 	}
 	return arr
end

def pos_list(arr)
	arr2 = arr.map{|x| find_del(x) }
	arr2 = arr2.flatten.uniq
	puts "#{arr2}"
end

# 23
def find_two_min(arr)
  return arr.sort.take(2) 
end

