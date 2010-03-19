Given /^there is a projects API$/ do
  projects_json = File.new(File.join(File.dirname(__FILE__), *%w[.. .. fixtures projects.json])).read
  stub_request(:get, /myapi.com\/projects.json/).to_return(:body => projects_json, :status => 200)
end

When /^I am on the home page$/ do
  get "/"
end

Then /^it should greet me$/ do
  last_response.body.should include("mike")
end

When /^I am on the projects page$/ do
  get "/projects"
end

Then /^it should show a project$/ do
  last_response.body.should include("My exciting project")
end