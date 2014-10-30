require 'faker'

30.times do
  User.create(:username => Faker::Lorem.word, :password => "fakepass", :fname => Faker::Lorem.word, :lname => Faker::Lorem.word, :email => Faker::Internet.email)
end

# User.all.each do |user|
#   10.times do
#     user.followers << User.all.sample.id
#   end
# end
200.times do
  Twit.create(:content => Faker::Lorem.sentence, :user_id => User.all.sample.id)
end

100.times do
  Relationship.create(:user => User.all.sample.id, :follower => User.all.sample.id)
end

# 200.times do
#   Twit.create(:content => Faker::Lorem.sentence, :user_id => User.all.sample.id)
# end
