require 'pp'

require_relative 'user'


user = User.new('john@aol.com', 'john')

pp user

user.save

