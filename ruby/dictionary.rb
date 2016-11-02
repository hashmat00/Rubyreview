dictionary = {
    
    'new york' => '212',
    'antioch' => '925',
    'fremont' => '510',
    'tracy' => '209'
}

def list_city_name(city)
    city.each {|k, v| puts k }
end


def get_area_code(somehash, key)
    somehash[key]
end



loop do 
    
    puts 'Do you want to lookup a city with area code (Y or NO)'
   answer = gets.chomp.downcase
   
   if answer != 'y'
       break
   end
   
   puts 'Which city do you want to lookup the area code'
   
   list_city_name(dictionary)
   puts 'Please choose your city'
   prompt = gets.chomp
   
   if dictionary.include?(prompt)
       puts "The area code for #{prompt} is #{get_area_code(dictionary, prompt) }"
   else
       puts 'The city you have entered is not in our database'
   end
    
    
end