Then(/^I wait a second to see if that helps the CI server$/) do
  # You should never wait in tests! I'm adding this temporarily as a debugging
  # measure for the CI server.
  sleep 1
end
