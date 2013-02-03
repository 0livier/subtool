Feature: Parser Import / Export should get and write content properly

  In order to modify users' srt files
  As a developer of subtool
  I want it to load and write them correctly

  Scenario: Srt Loading
    When I parse a Srt file named "features/files/simple.srt"
    Then I should have the following subtitles:
      | id | start   | end     | body                                          |
      | 1  | 20000   | 24400   | Altocumulus clouds occur between six thousand |
      | 2  | 24600   | 27800   | and twenty thousand feet above ground level.  |
      | 3  | 3661100 | 7322200 | QUACK\n\\_o<                                  |

  Scenario: Writing file
    When I parse a Srt file named "features/files/simple.srt"
    And I export the subtitles to a file named "tmp/output_simple.srt"
    And I parse a Srt file named "tmp/output_simple.srt"
    Then I should have the following subtitles:
      | id | start   | end     | body                                          |
      | 1  | 20000   | 24400   | Altocumulus clouds occur between six thousand |
      | 2  | 24600   | 27800   | and twenty thousand feet above ground level.  |
      | 3  | 3661100 | 7322200 | QUACK\n\\_o<                                  |

  # need to call the binary since we do not capture the output of current process
  Scenario: Writing file on STDOUT
    When I call "subtool" with the argument "-i ../../features/files/simple.srt add 0"
    Then the output should contain "1\n00:00:20,000 --> 00:00:24,400\nAltocumulus clouds occur between six thousand"
     And the output should contain "2\n00:00:24,600 --> 00:00:27,800\nand twenty thousand feet above ground level."
     And the output should contain "3\n01:01:01,100 --> 02:02:02,200\nQUACK"
