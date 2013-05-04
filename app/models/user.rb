class User < ActiveRecord::Base
  attr_accessible :email, :home_location, :username
  validates_presence_of :email, :username
end
