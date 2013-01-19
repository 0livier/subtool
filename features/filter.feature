Feature: Modifying Parser Import / Export should get and write content properly

  In order to modify users' srt files
  As a developer of subtool
  I want it to modify them properly

  Scenario: Adding delay
    When I parse a Srt file named "features/files/simple.srt"
    And I add a delay of 1 second
    Then I should have the following subtitles:
      | id | start   | end     | body                                          |
      | 1  | 21000   | 25400   | Altocumulus clouds occur between six thousand |
      | 2  | 25600   | 28800   | and twenty thousand feet above ground level.  |
      | 3  | 3662100 | 7323200 | QUACK\n\\_o<                                  |

  Scenario: Adding delay
    When I parse a Srt file named "features/files/simple.srt"
    And I add a delay of -1.5 second
    Then I should have the following subtitles:
      | id | start   | end     | body                                          |
      | 1  | 18500   | 22900   | Altocumulus clouds occur between six thousand |
      | 2  | 23100   | 26300   | and twenty thousand feet above ground level.  |
      | 3  | 3659600 | 7320700 | QUACK\n\\_o<                                  |

  Scenario: Adding a delay to a file and reparsing it
    When I parse a Srt file named "features/files/simple.srt"
    And I add a delay of 2.1 second
    And I export the subtitles to a file named "tmp/output_simple.srt"
    And I parse a Srt file named "tmp/output_simple.srt"
    Then I should have the following subtitles:
      | id | start   | end     | body                                          |
      | 1  | 22100   | 26500   | Altocumulus clouds occur between six thousand |
      | 2  | 26700   | 29900   | and twenty thousand feet above ground level.  |
      | 3  | 3663200 | 7324300 | QUACK\n\\_o<                                  |


  Scenario: Adding delay
    When I parse a Srt file named "features/files/simple.srt"
    And I add a delay of -1.5 second
    Then I should have the following subtitles:
      | id | start   | end     | body                                          |
      | 1  | 18500   | 22900   | Altocumulus clouds occur between six thousand |
      | 2  | 23100   | 26300   | and twenty thousand feet above ground level.  |
      | 3  | 3659600 | 7320700 | QUACK\n\\_o<                                  |

  Scenario: Adding a delay to a file and reparsing it
    When I parse a Srt file named "features/files/simple.srt"
    And I add a delay of 2.1 second
    And I export the subtitles to a file named "tmp/output_simple.srt"
    And I parse a Srt file named "tmp/output_simple.srt"
    Then I should have the following subtitles:
      | id | start   | end     | body                                          |
      | 1  | 22100   | 26500   | Altocumulus clouds occur between six thousand |
      | 2  | 26700   | 29900   | and twenty thousand feet above ground level.  |
      | 3  | 3663200 | 7324300 | QUACK\n\\_o<                                  |
