# frozen_string_literal: true

require 'require_all'
require 'testcentricity_apps'

include TestCentricity
include Test::Unit::Assertions


require_relative 'world_data'
require_relative 'world_screens'

require_rel 'data'
require_rel 'sections'
require_rel 'screens'

$LOAD_PATH << './lib'

# set the default locale and auto load all translations from config/locales/*.rb,yml.
ENV['LOCALE'] = 'en-US' unless ENV['LOCALE']
ENV['LANGUAGE'] = 'en' unless ENV['LANGUAGE']
I18n.load_path += Dir['config/locales/*.{rb,yml}']
I18n.default_locale = ENV['LOCALE']
I18n.locale = ENV['LOCALE']
Faker::Config.locale = ENV['LOCALE']

# instantiate all data objects and target test environment
include WorldData
environs.find_environ(ENV['TEST_ENVIRONMENT'], :yaml)
WorldData.instantiate_data_objects

# instantiate all screen objects
include WorldScreens
WorldScreens.instantiate_screen_objects

# set TestCentricity's default max wait time to 10 seconds
Environ.default_max_wait_time = 10
