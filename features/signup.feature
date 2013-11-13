Feature: sign up structure
in order to add links
as a user
I need a sign in  and sign out feature.

	
	Background:
		Given I am on the homepage

	Scenario: Sign up page
		Given I am on the homepage
		When I follow "Sign up"
		Then I should see "This is our registration page"

	Scenario: User signs up
		Given I am on the homepage
		When I follow "Sign up"
		When I sign up with the email "abdi@live.com" and username "abdi" password "abdi" and password confirmation "abdi"
		Then I should see "Welcome, abdi@live.com"

	
