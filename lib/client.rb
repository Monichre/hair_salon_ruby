class Client
  attr_reader(:name, :stylist_id, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:==) do |another_client|
    self.name() == (another_client.name()) && self.stylist_id == another_client.stylist_id
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id').to_i
      clients.push(Client.new({:name => name, :stylist_id => stylist_id}))
    end
    clients
  end

  def save
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def update(attributes)
    @name = attributes.fetch(:name)
    @stylist_id = self.stylist_id
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
  end

end
