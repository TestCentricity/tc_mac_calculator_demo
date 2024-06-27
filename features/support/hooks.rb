BeforeAll do
  $feature = nil
  # create Cucumber reports folder if it doesn't already exist
  if ENV['REPORTING']
    reports_path = "#{Dir.pwd}/reports"
    Dir.mkdir(reports_path) unless Dir.exist?(reports_path)
  end
  # start Appium Server if command line option was specified
  if ENV['APPIUM_SERVER'] == 'run'
    $server = AppiumServer.new
    $server.start
  end
end


AfterAll do
  # close Appium driver
  AppiumConnect.quit_driver
  # terminate Appium Server if command line option was specified and Appium server is running
  if ENV['APPIUM_SERVER'] == 'run' && Environ.driver == :appium && $server.running?
    $server.stop
  end
end


Before do |scenario|
  # if executing tests in parallel concurrent threads, print thread number with scenario name
  message = Environ.parallel ? "Thread ##{Environ.process_num} | Scenario:  #{scenario.name}" : "Scenario:  #{scenario.name}"
  log message
  $initialized ||= false
  unless $initialized
    $initialized = true
    # connect to Appium driver and install app
    caps = if ENV['W3C_CAPS']
             capabilities.find_capabilities(ENV['W3C_CAPS'])
             Capabilities.current.caps
           else
             nil
           end
    AppiumConnect.initialize_appium(caps)
    # HTML report header information if reporting is enabled
    log Environ.report_header if ENV['REPORTING']
  end
 end


After do |scenario|
  # process and embed any screenshots recorded during execution of scenario
  process_embed_screenshots(scenario)
  # clear out any queued screenshots
  Environ.reset_contexts
  # close app
  AppiumConnect.terminate_app
end


# supporting methods

def screen_shot_and_save_page(scenario)
  filename = "Screenshot-#{Time.now.strftime('%Y%m%d%H%M%S%L')}.png"
  path = File.join Dir.pwd, 'reports/screenshots/', filename
  AppiumConnect.take_screenshot(path)
  log "Screenshot saved at #{path}"
  screen_shot = { path: path, filename: filename }
  Environ.save_screen_shot(screen_shot)
  attach(path, 'image/png') unless scenario.nil?
end

def process_embed_screenshots(scenario)
  screen_shots = Environ.get_screen_shots
  if screen_shots.count > 0
    screen_shots.each do |row|
      path = row[:path]
      attach(path, 'image/png')
    end
  else
    screen_shot_and_save_page(scenario) if scenario.failed?
  end
end
