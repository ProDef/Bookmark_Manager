Feature: Viewing Links
	In order to avoid having a huge memory
	As a person who loves surfing the web
	I want to view the link I saved before

	Scenario: Viewing a link
		Given I am on the homepage				
		And I add a link "Youtube" with url "http://www.youtube.com" and description "Youtube, upload and views videos" and tags "social media"
		Then I should see "Youtube" within "article"
	
	Scenario: Adding a link
		Given I am on the homepage
		And I add a link "Youtube" with url "http://www.youtube.com" and description "Youtube, upload and views videos" and tags "social media"




