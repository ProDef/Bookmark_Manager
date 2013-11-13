Feature: Tags
	In order to organise my bookmarks
	As a person who loves surfing the web
	I want to be able to tag my bookmarks


	Scenario: Filtering by tags
		Given I am on the homepage
		And I add a link "Youtube" with url "http://wwww.youtube.com" and description "Youtube, upload and views videos" and tags "video"
		And I add a link "Facebook" with url "http://wwww.facebook.com" and description "social media site" and tags "social media"
		#Then I filter by the tag "video"
		#Then I should see "Youtube"
		#And I should not see "facebook"


