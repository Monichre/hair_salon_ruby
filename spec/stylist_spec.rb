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
end
