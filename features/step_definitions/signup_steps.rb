   Given(/^abdi signs up with the email "(.*?)" and password "(.*?)" and password confirmation "(.*?)"$/) do |email, password, password_confirmation|
   click_link('Sign up')
   fill_in :email, :with => email
   fill_in :password, :with => password
   fill_in :password_confirmation, :with => password_confirmation
   click_button('sign up')
 end
 
   Given(/^nadia signs up with the email "(.*?)" and password "(.*?)" and password confirmation "(.*?)"$/) do |email, password, password_confirmation|
   click_link('Sign up')
   fill_in :email, :with => email
   fill_in :password, :with => password
   fill_in :password_confirmation, :with => password_confirmation
   click_button('sign up')
 end
 
   When(/^sarah signs up with the email "(.*?)" and password "(.*?)" and password confirmation "(.*?)"$/) do |email, password, password_confirmation|
   click_link('Sign up')
   fill_in :email, :with => email
   fill_in :password, :with => password
   fill_in :password_confirmation, :with => password_confirmation
   click_button('sign up')
 end