require('spec_helper')

describe(Client) do
  describe("#==") do
    it("is the same client if they have the same name") do
      test_client1 = Client.new({:name => "Doris", :stylist_id => 1})
      test_client2 = Client.new({:name => "Doris", :stylist_id => 1})
      expect(test_client1).to(eq(test_client2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#stylist_id") do
    it("lets you read the stylist ID out") do
      test_client = Client.new({:name => "Darren", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:name => "Doris", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#id') do
    it "returns the id" do
      test_client = Client.new({:name => "Doris", :stylist_id => 1})
      test_client.save()
      expect(test_client.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#update") do
    it("lets you update clients in the database") do
      client = Client.new({:name => "Franky", :stylist_id => 1, :id => nil})
      client.save()
      client.update({:name => "Franky Boy"})
      expect(client.name()).to(eq("Franky Boy"))
    end
  end

  describe("#delete") do
    it("lets you delete a client from the database") do
      client = Client.new({:name => "Tony", :id => nil, :stylist_id => 1})
      client.save()
      client2 = Client.new({:name => "Jack", :id => nil, :stylist_id => 1})
      client2.save()
      client.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end
end
