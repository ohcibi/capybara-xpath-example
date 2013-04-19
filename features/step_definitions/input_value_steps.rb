Given(/^I am at the index page$/) do
  visit '/'
end

Then(/^I see a range input with value (\d+)$/) do |value|
  expect(page).to have_xpath %Q{//input[@value="#{value}"]}
end
