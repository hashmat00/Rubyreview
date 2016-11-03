class User
    
    attr_accessor :name, :email
    
   def initialize(name, email)
       @name = name
       @email = email
       
   end
   
  
    
end


user = User.new('hashmat', 'hashmat00@aol.com')


puts "My name is #{user.name} and my email is #{user.email}"

user.name = 'John'
user.email = 'john@aol.com'

puts "My user new name  is #{user.name} and new email is #{user.email}"