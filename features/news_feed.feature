Feature: News feed

    As a user
    When I visit the home page
    I should see the most recent bleats
    
    Scenario: Recent bleats
        Given 5 bleats exist
        And a bleat with the content "howdy!"
        When I visit the home page
        Then the first bleat should contain "howdy!"
        
    Scenario: Trending hashtags
        Given a bleat with the content "#winning"
        When I visit the home page
        Then "#winning" should be a trending hashtag

    Scenario: Hashtag links
        Given a bleat with the content "#winning"
        When I visit the home page
        Then the first bleat should contain a link to the "#winning" tag
