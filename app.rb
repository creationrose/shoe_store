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

patch "/brands/:id" do
  brand_id = params["id"].to_i
  @brand = Brand.find(brand_id)
  @store_ids = params["store_ids"]
  @brand.update({:store_ids => @store_ids})
  @stores = Store.all
  erb :brand_info
end

patch "/stores/:id" do
  store_id = params["id"].to_i
  @store = Store.find(store_id)
  @brand_ids = params["brand_ids"]
  if @brand_ids
    @store.update({:brand_ids => @brand_ids})
  end
  @brands = Brand.all
  erb(:store_info)
end

get "/brands/:id/edit" do
  brand_id = params["id"].to_i
  @brand = Brand.find(brand_id)
  erb :brand_edit
end

get "/stores/:id/edit" do
  store_id = params["id"].to_i
  @store = Store.find(store_id)
  erb :store_edit
end

patch '/brands/:id/edit' do
  brand_name = params["brand_name"]
  brand_id = params["id"].to_i
  @brand = Brand.find(brand_id)
  @brand.update({:brand_name => brand_name})
  @brands = Brand.all
  erb :brand
end

patch '/stores/:id/edit' do
  store_name = params["store_name"]
  store_id = params["id"].to_i
  @store = Store.find(store_id)
  @store.update({:store_name => store_name})
  @stores = Store.all
  erb :store
end

delete '/brands/:id/edit' do
  brand_id = params["id"].to_i
  @brand = Brand.find(brand_id)
  @brand.destroy
  redirect "/"
end

delete '/stores/:id/edit' do
  store_id = params["id"].to_i
  @store = Store.find(store_id)
  @store.destroy
  redirect "/"
end
