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

# describe('seeing details for a single list', {:type => :feature}) do
#   it('allows a user to click a list to see the tasks and details for it') do
#     test_list = List.new({:name => 'School stuff'})
#     test_list.save()
#     test_task = Task.new({:description => "learn SQL", :list_id => test_list.id()})
#     test_task.save()
#     visit('/lists')
#     click_link(test_list.name())
#     expect(page).to have_content("Browse our current stylists")
#   end
# end
