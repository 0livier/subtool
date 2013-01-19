Feature: Getting Help

   In order to RTFM
   As a user of subtool
   I want to get the manual

  Scenario: Getting help with --help
    When I call "subtool" with the argument "--help"
    Then the exit status should be 0
    Then the output should contain "Usage"

  Scenario: exit status of 0
    When I call "subtool" with the argument ""
    Then the exit status should be 0
    Then the output should contain "Usage"

  Scenario: Getting help when no command is given
    When I call "subtool" with the argument "-i features/files/simple.srt"
    Then the exit status should be 0
    Then the output should contain "Usage"
