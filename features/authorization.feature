@twitter
Feature: Authentication
  In order to get more followers
  As a user
  I want to sign in with Twitter

  Scenario: Verified user logs in via Twitter
    Given I am a verified user
    And I am on the home page
    When I sign in via Twitter
    Then I should be signed in

  Scenario: Unverified user logs in via Twitter
    Given I am an unverified user
    And I am on the home page
    When I sign in via Twitter
    Then I should not be signed in
    And I should be told that I need to be verified
