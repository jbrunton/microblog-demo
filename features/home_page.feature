Feature: Home page

    As a user
    When I visit the home page
    I should see the most recent bleats
    
    Scenario: Recent tweets
        Given a new bleat with the content #winning
        When I visit the home page
        Then the first bleat on the home page should contain #winning
        
