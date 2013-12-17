Given /^I am on (.+)$/ do |url|
  visit "/"
end
 
When /^I fill in "([^"]*)" found by "([^"]*)" with "([^"]*)"$/ do |value, type, keys|
  fill_in(value, :with => keys)
end
 
When /^I submit$/ do
  find_field('q').native.send_key(:enter)
end
 
Then /^I should see title "([^"]*)"$/ do |title|
  expect(page).to have_title title
end



