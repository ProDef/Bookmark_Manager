Feature: page structure
in order to see something
as a visitor
I need some sort of ui

	Background:
		Given I am on the homepage
	
	Scenario: The title
		Given I am on the homepage
		Then I should see "Bookmark Manager"

	Scenario: The add link button
		Given I am on the homepage
		Then I should see "Add Link"

	Scenario: Sign up and Sign in
		Given I am on the homepage
		Then I should see "Sign up"
		And I should see "Sign in"

	Scenario: The Footer
		Given I am on the homepage
		Then I should see "Makers Academy"
