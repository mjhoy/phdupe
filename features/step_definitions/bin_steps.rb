When /^I run the script with "([^"]*)"$/ do |args|
  When %{I run "#{$SCRIPT_BIN} #{args}"}
end
