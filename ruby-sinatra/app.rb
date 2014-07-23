require 'rubygems'
require 'sinatra'
require 'mongo'
require 'json/ext' # required for .to_json

include Mongo

configure do
  conn = MongoClient.new("localhost", 27017)
  set :mongo_connection, conn
  set :mongo_db, conn.db('quipper_web_development')
end

get "/ping" do
  content_type :json
  user = settings.mongo_db['users'].find_one(username: "student1")
  {username: user["username"]}.to_json
end
