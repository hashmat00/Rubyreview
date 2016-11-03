module Destructable
    def destroy(anything)
        puts 'i will destroy the object'
    end
end

class User
    include Destructable
    
    attr_accessor :name, :email
    
   def initialize(name, email)
       @name = name
       @email = email
       
   end
   
  
    
end



class Buyer < User
    def run
        puts 'hi i am buyer'
    end
    
end


class Seller < User
    
end


class Admin < User
    
end



user = User.new('hashmat', 'hashmat00@aol.com')


puts "My name is #{user.name} and my email is #{user.email}"

user.name = 'John'
user.email = 'john@aol.com'

puts "My user new name  is #{user.name} and new email is #{user.email}"

buyer1 = User.new('buyer1', 'buyer@aol.com')
puts "My  name  is #{buyer1.name} and new email is #{buyer1.email}"


seller1 = User.new('seller1', 'seller@aol.com')
puts "My  name  is #{seller1.name} and new email is #{seller1.email}"


user.destroy('myname')