require "sinatra"
require "shotgun"

get "/hello" do
  @visitor = params[:name]
  @name = %w(Amigo Oscar Viking).sample
  erb :index
end
