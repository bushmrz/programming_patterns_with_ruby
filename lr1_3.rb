def find_min(arr)
	min = arr[0]
	for x in arr do 
		if x<min 
			min = x
		end
	end
	puts min
end

def find_first_pos(arr)
	for i in 0..arr.length
		return puts i if arr[i].to_i>0
	end

	return puts -1 
end

arr = [-4, -5, 9, 0, 14, 19, -14, 13, 1, -9, 7, 6]
find_min(arr)
find_first_pos(arr)