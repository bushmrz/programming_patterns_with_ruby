puts 'Hello  World'

s = `whoami`
puts "#{s}"
puts 'Hello #{ARGV[0]}. Ur fav lang?'
txtt = gets.chomp
case txtt
	when 'c++'
		puts 'cool'
	when 'java'
		puts 'u re crazy'
	when 'ruby'
		puts 'podliza'
	else 
		puts 'okay'
	end

puts 'Enter ruby command: '
comRuby = gets.chomp
system "ruby -e \'#{comRuby}\'"

puts 'Enter OS command: '
comSys = gets.chomp
puts `#{comSys}`
		
