class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, options[:message] || :email) unless
      value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
#the above was created with annotate --position before
class User < ActiveRecord::Base
  include ActiveModel::Validations
  attr_accessible :name, :password, :password_confirmation, :email   #Explicitly sets which "properties" of the class are publically available, used to prevent a mass assignment attack in RAILS
  has_secure_password
  
  #some validation
  validates(:name, presence: true, length: {maximum: 50}) #make sure name attribute exists
  validates(:email, presence: true, email: true, uniqueness: {case_sensitive: false}) #make sure email attribute exists
  validates(:password, presence: true)
  #
  
end
