Feature: Language Translation
    As a user,
    I want to see application labels and messages in my own language
    So that I can understand what the application is saying

Background: 
Given the following languages exist:
  | Name    | Culture |
  | English | en-US   |
  | Polish  | pl      |
  | Italian | it-IT   | 
And the following translations exist:
  | Language | Key                 | Translation             |
  | English  | Invalid Login       | Invalid Login           |
  | Polish   | Invalid Login       | NieprawidÅowy login     |
  | Italian  | Invalid Login       | Login non valido        |
And the following users exist:
  | FirstName | LastName  | UserName   | Language |
  | Frank     | Castillo  | fcastillo  | Italian  |
  | Doug      | Messerski | dmesserski | Polish   |
  | Peter     | Jones     | pjones     |          |
 

Scenario: Receive Messages in my Set Language
    Given I am the user "fcastillo"
    When the system sends the message "Invalid Login"
    Then I should see the error message "Login non valido"

Scenario: Receive a Message in my Site Set Language
    Given I am the user "pjones"
        And my site language is set to "Polish"
    When the system sends the message "Invalid Login"
    Then I should see the error message "NieprawidÅowy login"

Scenario: Change the language I use
    Given I am the user "dmesserski"
    When I set my my language to "Italian"
    Then my language should be equal to "Italian"