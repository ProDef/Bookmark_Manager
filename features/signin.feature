Feature: User signs in do
in order to sign in
as a user
I need a sign in

  Background
    Given I am on the homepage

    Scenario: Sign in with correct details
      Given I am on the homepage
      And abdi signs in with the email "abdi@live.com" and the password "abdi"

     Scenario: Sign in with wrong details
      Given I am on the homepage
      And james signs in with the email "lion@live.com" and the password "happy"
      Then I should see "The email or password are incorrect"