Feature: sign up structure
in order to add links
as a user
I need a sign in and sign out feature.

	
	Background:
		Given I am on the homepage

	Scenario: Sign up
		Given I am on the homepage
		When I follow "Sign up"
		Then I should see "This is our registration page"

	Scenario: User signs up
		And abdi signs up with email "abdi@live.com" and password "abdi" and password confirmation "abdi"
		Then I should see "wassup abdi@live.com"

	
