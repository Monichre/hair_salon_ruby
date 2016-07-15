require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})


get("/") do
  erb(:index)
end

post('/stylists') do
  stylist_name = params.fetch('stylist_name')
  client_name = params.fetch('client_name')
  stylist = Stylist.new({:name => stylist_name, :id => nil})
  stylist.save()
  client = Client.new({:name => client_name, :stylist_id => stylist.id()})
  client.save()
  erb(:success)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist)
end

post('/stylists/:id/clients') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  new_client_name = params.fetch('new_client_name')
  new_client = Client.new({:name => new_client_name, :stylist_id => @stylist.id()})
  new_client.save()
  erb(:stylist)
end
