class User
  attr_accessor :name, :email #Getter and Setter methods (Properties), sets them to the two variables @name and @email
  
  def initialize(attributes = {}) #Ruby's constructor, special method, attributes variable with a default value of an empty hash 
    @name = attributes[:name]
    @email = attributes[:email]
  end
  
  def formatted_email
    "#{name} <#{email}>" #String interpolation to create a inferred return type with name and email variables
  end
end

class String
  def Shuffle
    if !self.empty?
      self.split('').shuffle.join('')
    end
  end
end