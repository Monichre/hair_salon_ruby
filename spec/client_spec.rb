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
end
