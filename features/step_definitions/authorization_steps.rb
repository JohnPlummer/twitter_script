Given /^I am signed in$/ do
  visit login_path
  visit callback_path
end

Given /^I am a verified user$/ do
  account = Factory(:account, :name => 'jp_alpha', :verified => true)
end

Given /^I am an unverified user$/ do
  account = Factory(:account, :name => 'jp_alpha', :verified => false)
end

When /^Twitter authorizes me$/ do
  visit callback_path
end

When /^I sign in via Twitter$/ do
  And "I follow \"Sign in with Twitter\""
  And "Twitter authorizes me"
end

Then /^I should be signed in$/ do
  Then "I should see \"Sign out\""
end

Then /^I should not be signed in$/ do
  Then "I should see \"Sign in\""
end

Then /^I should be told that I need to be verified$/ do
  Then "I should see \"Sorry, your account needs to be verified.\""
end

