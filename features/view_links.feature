Feature: Viewing Links
	In order to avoid having a huge memory
	As a person who loves surfing the web
	I want to view the link I saved before

	Scenario: Viewing a link
		Given the following links have been saved:
			| title			 | url						|
			| Makers Academy | http://makersacademy.com |
		When I am on the homepage
		Then I should see "Makers Academy" within "article"
	
	Scenario: Adding a link
		Given I am on the homepage
		And I add a link "Youtube" with url "www.youtube.com"
		Then I should see "Youtube"