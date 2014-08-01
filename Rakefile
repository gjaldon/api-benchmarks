require 'faker'
require 'mongo'

def build_user(attributes = {})
  {
    created_at: Time.now,
    updated_at: Time.now,
    username: Faker::Internet.user_name,
    display_name: Faker::Name.name,
    time_zone: Faker::Address.time_zone,
    email: Faker::Internet.email,
    guest: [true, false].sample,
    coins: rand(10000)
  }.merge attributes
end

task :seed do
  db = Mongo::MongoClient.new("localhost", 27017).db("quipper_web_development")
  coll = db["users"]
  coll.remove

  coll.insert build_user(username: 'student1')
  999.times.each do
    coll.insert build_user
  end
  puts "collection count: #{coll.count}"
end

task :default => :seed
