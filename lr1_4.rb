def fun1(arr,r)
	arr1 = arr.map{|x| (x-r).abs }
	ind = arr1.index(arr1.min)
	puts "#{arr[ind]}"
	#puts "#{arr1}"
end
