When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

When(/^(?:I|they) click the( \w*)? "([^"]*)" link$/) do |ordinal, link|
  if not ordinal
    click_link link
  else
    case ordinal
    when ' first'
      index = 0
    when ' second'
      index = 1
    when ' third'
      index = 2
    else
      raise 'do not understand ordinal value'
    end
    all(:link, link)[index].click
  end
end

Then(/^I should( \w*)? see "([^"]*)"(?: form)*$/) do |noty, string|
  if noty
    expect(page.body).to_not have_text string
  else
    expect(page.body).to have_text string
  end
end

Then(/^I should see "([^"]*)" after "([^"]*)"$/) do |str1, str2|
  role, email = str2.split(':')
  id = User.find_by(email: email).send("as_#{role}").id
  within("##{role}-#{id}") { expect(page).to have_content(str1) }
end

When(/^I click the "([^"]*)" button$/) do |button|
  click_button button  
end

And(/^I check "([^"]*)"$/) do |item|
  check item
end

When(/^I select "([^"]*)" in select list "([^"]*)"$/) do |item, list|
  find(:select, list).find(:option, item).select_option
end