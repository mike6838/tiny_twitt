class Relationship < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :follower, :class_name => "User"
end
