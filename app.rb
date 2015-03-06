require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'sinatra/reloader'   #Errors, so not included connection with sinatra-contrib, in Gemfile


get "/" do
  erb :index
end

get "/brands" do
  @brands = Brand.all
  erb :brand
end

get "/stores" do
  @stores = Store.all
  erb :store
end

post "/brands" do
  brand_name = params["brand_name"]
  brand = Brand.create({:brand_name => brand_name})
  @brands = Brand.all
  erb :brand
end

post "/stores" do
  store_name = params["store_name"]
  store = Store.create({:store_name => store_name})
  @stores = Store.all
  erb :store
end

get "/brands/:id" do
  @brand = Brand.find(params["id"].to_i)
  @stores = Store.all
  erb :brand_info
end

get "/stores/:id" do
  @store = Store.find(params["id"].to_i)
  @brands = Brand.all
  erb :store_info
end
