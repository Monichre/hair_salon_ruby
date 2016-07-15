class Client
  attr_reader(:name, :stylist_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    # @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:==) do |another_client|
    self.name() == (another_client.name())
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id')
      clients.push(Client.new({:name => name, :stlyist_id => stylist_id}))
    end
    clients
  end

  def save
    DB.exec("INSERT INTO clients (name) VALUES ('#{@name}');")
  end
end
