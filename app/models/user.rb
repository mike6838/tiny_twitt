class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :twits

  has_many :followings, foreign_key: :followee_id, class_name: 'Following'
  has_many :followees, :through => :followings

  # has_many :reverse_followings, foreign_key: :followee_id, class_name: 'Following'
  # has_many :followees, :through => :reverse_followings

end
