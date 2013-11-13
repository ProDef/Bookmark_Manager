Feature: sign up structure
in order to add links
as a user
I need a sign up feature.

	Background:
    	Given I am on the homepage
 
  	Scenario: User signs up
     	And abdi signs up with the email "abdi@live.com" and password "abdi" and password confirmation "abdi"
     	Then I should see "Welcome, abdi@live.com"
 
   Scenario: User cannot sign up with non-matching passwords
     	And nadia signs up with the email "nadia@live.com" and password "nadia" and password confirmation "cheese"
     	Then I should not see "Welcome, nadia@live.com"
 
   Scenario: User gets prompted to sign up again if passwords do not match
    	 And abdi signs up with the email "abdi@live.com" and password "abdi" and password confirmation "yellow"
    	 Then I should be on users
    	 And I should see "Password does not match the confirmation"
 
   Scenario: User cannot sign up with email already in use
	     When sarah signs up with the email "sarah@live.com" and password "love" and password confirmation "love"
	     And sarah signs up with the email "sarah@live.com" and password "green" and password confirmation "green"
	     Then I should see "This email is already taken"
