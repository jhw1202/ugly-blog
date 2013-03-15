require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
    before_create :assign_password
  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, :message => "Email is not valid"}
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :hashed_password, :presence => true
  has_many :posts


  def assign_password
    self.hashed_password = Password.new(params[:hashed_password])
  end

end
