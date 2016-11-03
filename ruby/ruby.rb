# y = [ 1,2,3,4,5,6,7,8,9,55,5,4,3,3,3]


# y

# for number in y
# puts 'hashmat'
# end


# names = ['hashmat', 'omid', 'johnny', 'williams']

# names.each do |x|
#     puts "hello #{x.capitalize}"
# end



# x = [ 1,2,3,4,5,6,7,8,9,10,11,12,13,14]

# x.select { |number| puts number.odd? }

# x.each  {|y| puts y if y.odd? }

# x.each do |number|
#     puts number if number.odd?
# end



# hello = {'name' => 'hashmat', 'age' => '30'}

# puts hello['name']

# myhash = {a: 1, b: 3, c: 4}
# puts myhash[:a]

# myhash[:e] = 8

# puts myhash


# myhash.delete(:c)
# puts myhash


num = {a: 1, b: 3, c: 4, d: 5, e: 6}

# num.each {|k, v| puts "Key is #{k}:  #{v}" }


num.each {|k, v|  num.delete(k) if v > 4 }
