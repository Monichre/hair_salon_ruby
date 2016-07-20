require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")
require('pry')

DB = PG.connect({:dbname => "hair_salon"})


get("/") do
  erb(:index)
end

post('/stylists') do
  stylist_name = params.fetch('stylist_name')
  client_name = params.fetch('client_name')
  stylist = Stylist.new({:name => stylist_name, :id => nil})
  stylist.save()
  client = Client.new({:name => client_name, :stylist_id => stylist.id(), :id => nil})
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

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:edit_stylist)
end

patch('/stylists/:id/') do
  stylist = Stylist.find(params.fetch('id').to_i)
  new_name = params.fetch('new_stylist_name')
  stylist.update({:name => new_name})
  erb(:stylist)
end

delete('/stylists/:id/delete') do
  stylist = Stylist.find(params.fetch('id').to_i)
  stylist.delete
  redirect('/stylists')
end

post('/stylists/:id/clients/new_client') do
  stylist = Stylist.find(params.fetch('id').to_i)
  new_client_name = params.fetch('new_client_name')
  new_client = Client.new({:name => new_client_name, :stylist_id => stylist.id(), :id => nil})
  new_client.save()
  redirect('/stylists/' + stylist.id.to_s)
end


get('/stylists/:id/clients/:client_id') do
  # @stylist = Stylist.find(params.fetch('id').to_i)
  @client = Client.find(params.fetch('id').to_i)
  erb(:client)
end

# patch('/stylists/clients/:client_id/') do
#   client = Client.find(params.fetch('client.id'))
#   name = params.fetch('update_client_name')
#   client.update({:name => name})
#   redirect('/stylists/clients/:client_id')
# end
