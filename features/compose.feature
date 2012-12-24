Feature: Compose

    As a user
    When I am logged in
    I want to post a new bleat
    
    Scenario: Compose new bleat
        Given I am authenticated
        And I have 5 bleats
        When I compose a bleat with content "hey there!"
        And I visit my profile
        Then the first bleat should contain "hey there!"

    Scenario: Fail validation
        Given I am authenticated
        When I compose a bleat with content ""
        Then an "alert" should be visible
