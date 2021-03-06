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
    And an empty file named "baz/dont_copy.doc"

  Scenario: No or one arguments
    When I run the script with ""
    Then the output should contain "Usage"

  Scenario: One argument
    When I run the script with "baz"
    Then the output should contain "Usage"

  Scenario: Same arguments
    When I run the script with "baz baz"
    Then the output should contain "Usage"

  Scenario: Copy files
    When I run the script with "baz output"
    Then the following files should exist:
      | output/fa/a.jpg         |
      | output/la/b.jpg         |
      | output/c.jpg            |
      | output/fa/export/a.jpg  |

  Scenario: Rename sequence "*1.jpg" to "*01.jpg" option
    Given an empty file named "baz/fa/a-1.jpg"
    When I run the script with "baz output -i"
    Then the following files should exist:
      |output/fa/a-01.jpg|

  Scenario: Don't copy non-jpgs
    When I run the script with "baz output"
    Then the following files should not exist:
      | output/dont_copy.doc |

  Scenario: Export option
    When I run the script with "baz output -e"
    Then the following files should exist:
      | output/fa/a.jpg |
    And the following files should not exist:
      | output/la/b.jpg |
      | output/fa/export/a.jpg |
      | output/dont_copy.doc |
