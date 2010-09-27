Feature: Command line

  Background:
    Given a directory named "baz"
    And a directory named "output"
    And a directory named "baz/fa"
    And a directory named "baz/la"
    And an empty file named "baz/fa/a.jpg"
    And an empty file named "baz/la/b.jpg"
    And an empty file named "baz/c.jpg"
    And an empty file named "baz/fa/export/a.jpg"

  Scenario: No or one arguments
    When I run the script with ""
    Then the output should contain "Usage"

  Scenario: One argument
    When I run the script with "baz"
    Then the output should contain "Usage"

  Scenario: Same arguments
    When I run the script with "baz baz"
    Then the output should contain "Usage"

  Scenario: Working
    When I run the script with "baz output"
    Then the output should contain "foo"
