Feature: User signs out
in order to sign out of my account
as a user
I need to sign out


  Background:
    Given I am on the homepage

  Scenario: signing out
    Given I am on the homepage
    And ham signs in with the email "ham@mail.com" and the password "bun"
    Then I should see "Sign out"


