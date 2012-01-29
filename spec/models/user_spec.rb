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

require 'spec_helper'

describe User do

    before do
       
      @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar") #runs this code before each test, prepopulate if you will
    end
  
  subject {@user}
  
  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:authenticate)}
  
  
  describe "Sanity check, initial object is valid" do
    it {should be_valid}  
  end
  
  describe "When Password is blank" do
    before {@user.password =  @user.password_confirmation = " "}
    it {should_not be_valid}
  end
  
  describe "When Password does not match confirmation" do
    before {@user.password_confirmation="Mismatch"}
    it {should_not be_valid}
  end
  
  
  describe "when name is not present" do
    before {@user.name = " "}
    it {should_not be_valid}
  end

  #test to make sure validation in the user object exists.  Because we check for presence in the user object, if no email is set, validation should fail
  #this would cause the object to "not be valid", and we check for that state in this test
  describe "when email is not present" do
    before {@user.email = " "}
    it {should_not be_valid}
  end
  
  describe "when name is too long" do
    before {@user.name = "a" *51}
    it {should_not be_valid}
  end
  
  describe "when email format is not valid" do
    invalid_addresses = %w[user@foo,com, user@foo user_at_foo.com example.user@foo.]
    
    invalid_addresses.each  do |invalid_address|
      before {@user.email = invalid_address}      
      it {should_not be_valid}
    end
  end
  
  describe "when email format is valid" do
    valid_addresses = %w[user@foo.com, THE_USER@foo.bar.org, foo.user@foo.jp]
    
    valid_addresses.each  do |valid_address|
      before {@user.email = valid_address}
      it {should be_valid}
    end
  end
  
  describe "when email address is already taken" do #for email uniqueness
    before do
      #create duplicate email address
      duplicate_user = @user.dup  
      duplicate_user.email= @user.email.upcase
      duplicate_user.save    
    end
        
      it {should_not be_valid}
  
  end
  
  describe "return value of authenticate method" do #for password authentication
    
    before{@user.save}
    let (:found_user){User.find_by_email(@user.email)} #a convienent way to create local variables inside tests.  Found_user is a local variable in this case
    
    describe "with valid password" do
      it {should == found_user.authenticate(@user.password)}
    end
    
    describe "with incorrect password" do
      let(:invalid_user_password){found_user.authenticate("invalid")} #set local variable with a invalid password authenication method call 
      it {should_not == invalid_user_password}
      specify {invalid_user_password.should be_false} #specify is a synonym for it, can be used when writing "it" sounds funny.
      
    end
    
        
  end
end