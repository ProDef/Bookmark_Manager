Feature: login structure
in order to login
as a user
I need a login page

	
	Background:
		Given I am on the homepage

	#Scenario: Sign in
		Given I am on the homepage
		When I follow "Sign in"
		Then I should see "This is our login page"

	Scenario: Sign up

