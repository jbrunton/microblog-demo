Feature: Search

    As a user
    When I visit the home page
    I should be able to perform a free text search
    
    Scenario: Search
        Given a bleat with the content "howdy, y'all"
        When I visit the home page
        And I search for "howdy"
        Then the first bleat should contain "howdy"

        
