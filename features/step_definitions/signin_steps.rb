   Given(/^abdi signs in with the email "(.*?)" and the password "(.*?)"$/) do |email, password|
   click_link('Sign in')
   fill_in :email, :with => email
   fill_in :password, :with => password
   click_button('Sign in')
 end
 
    Given(/^james signs in with the email "(.*?)" and the password "(.*?)"$/) do |email, password|
   click_link('Sign in')
   fill_in :email, :with => email
   fill_in :password, :with => password
   click_button('Sign in')
 end
 