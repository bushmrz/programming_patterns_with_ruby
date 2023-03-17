# 11
def find_unique(arr) 
  arr = arr.sort
  if arr[0]!=arr[1] then return arr[0] else return arr[-1]
  end 
end

# 23
def find_two_min(arr)
  return arr.sort.take(2) 
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

# 59
def freqArr(arr)
  return arr.find_all{|x| x>0 && x<100 && arr.count(x)>2}.uniq
end

def quadro_pos_list(arr)
  arr = freqArr(arr)
  return arr.map{|x| x**2}
end

puts "Choose program
11 - find_unique
23 - find_two_min
35 - nearest_el
47 - pos_list
59 - quadro_pos_list"

meth = gets.chomp.to_i

case meth
	when meth = 11
		puts "Input array"
		arr = gets.chomp.split(' ').map(&:to_i)
		puts find_unique(arr)
	when meth = 23
		puts "Input array"
		arr = gets.chomp.split(' ').map(&:to_i)
  		puts find_two_min(arr)
	when meth = 35
		puts "Input array"
		arr = gets.chomp.split(' ').map(&:to_i)
		puts nearest_el(arr)
	when meth = 47
		puts "Input array"
		arr = gets.chomp.split(' ').map(&:to_i)
  		puts pos_list(arr)
	when meth = 59
		puts "Input array"
		arr1 = gets.chomp.split(' ').map(&:to_i)
		puts quadro_pos_list(arr)
	else
		puts "Error"
end
