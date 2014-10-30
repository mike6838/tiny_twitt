class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :twits
  has_many :relationships
  has_many :followers, :through => :relationships
end
