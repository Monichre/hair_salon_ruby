require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('index path', {:type => :feature}) do
  it('displays Home page') do
    visit('/')
    expect(page).to have_content("Ruby Salon")
  end
  it('displays Home page') do
    visit('/')
    click_link('Meet our stylists')
    expect(page).to have_content("There are no stylists at this time. Please contact our receptionist, thank you 555-555-5555")
  end
end

describe('stylists', {:type => :feature}) do
  it('seeing a list for all stylists') do
    test_stylist = Stylist.new({:name => 'Veronica', :id => nil})
    test_stylist.save()
    visit('/stylists')
    click_link(test_stylist.name())
    expect(page).to have_content("Veronica")
  end
end

describe('stylists/:id', {:type => :feature}) do
  it('clicking a stylist and seeing their clients') do
    test_stylist = Stylist.new({:name => 'Veronica', :id => nil})
    test_stylist.save()
    test_client = Client.new({:name => "Marve", :stylist_id => test_stylist.id()})
    test_client.save()
    visit('/stylists')
    click_link(test_stylist.name())
    expect(page).to have_content("Veronica")
    expect(page).to have_content("Marve")
  end
end
