Feature: sign up structure
in order to sign up
as a user
I need a sign in page

	
	Background:
		Given I am on the homepage

	Scenario: Sign up
		Given I am on the homepage
		When I follow "Sign up"
		Then I should see "This is our registration page"
	
	Scenario: Sign in
	
