require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end

    it "returns all stylists" do
      stylist = Stylist.new({:name => "Maurice", :id => nil})
      stylist.save
      stylist2 = Stylist.new({:name => "Barry", :id => nil})
      stylist2.save
      expect(Stylist.all()).to(eq([stylist, stylist2]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      stylist = Stylist.new({:name => "Maurice", :id => nil})
      expect(stylist.name()).to(eq("Maurice"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "Maurice", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save stylists to the database") do
      stylist = Stylist.new({:name => "Maurice", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      stylist = Stylist.new({:name => "Maurice", :id => nil})
      stylist2 = Stylist.new({:name => "Maurice", :id => nil})
      expect(stylist).to(eq(stylist2))
    end
  end

  describe('.find') do
    it "returns a stylist by its ID" do
      test_stylist = Stylist.new({:name => 'Maurice', :id => nil})
      test_stylist.save
      test_stylist2 = Stylist.new({:name => 'Barry', :id => nil})
      test_stylist2.save
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe('#clients') do
    it "returns an array of all clients" do
      test_stylist = Stylist.new({:name => 'Maurice', :id => nil})
      test_stylist.save
      client = Client.new({:name => "Terry", :stylist_id => test_stylist.id(), :id => nil})
      client.save
      client2 = Client.new({:name => "Berry", :stylist_id => test_stylist.id(), :id => nil})
      client2.save
      expect(test_stylist.clients()).to(eq([client, client2]))
    end
  end

  describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "Maurice", :id => nil})
      stylist.save()
      stylist.update({:name => "Maurice Turner"})
      expect(stylist.name()).to(eq("Maurice Turner"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Tony", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Jack", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:name => "Tony", :id => nil})
      stylist.save()
      client = Client.new({:name => "learn SQL", :stylist_id => stylist.id(), :id => nil})
      client.save()
      client2 = Client.new({:name => "Review Ruby", :stylist_id => stylist.id(), :id => nil})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end

end
