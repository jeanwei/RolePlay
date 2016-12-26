Given(/^I login as "([^"]*)"$/) do |email|
  step %{I click the "Log In" link}
  step %{I fill in "user[email]" with "#{email}"}
  step %{I fill in "user[password]" with "qwerty123"}
  step %{I click the "Log In" button}
  step %{I should see "Signed in successfully."}
end