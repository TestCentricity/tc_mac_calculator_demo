include TestCentricity


When(/^I (?:load|am on) the (.*) screen$/) do |screen_name|
  # find and load the specified target screen
  target_screen = ScreenManager.find_screen(screen_name)
  target_screen.load_screen
end


When(/^I (?:click|tap) the ([^\"]*) navigation menu item$/) do |screen_name|
  # find and navigate to the specified target screen
  target_screen = ScreenManager.find_screen(screen_name)
  target_screen.navigate_to
  ScreenManager.current_screen = target_screen
end


Then(/^I expect the (.*) screen to be correctly displayed$/) do |screen_name|
  # find and verify that the specified target screen is loaded
  target_screen = ScreenManager.find_screen(screen_name)
  target_screen.verify_screen_exists
  # verify that target screen is correctly displayed
  target_screen.verify_screen_ui
end
