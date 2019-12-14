$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "sms_global"

require "minitest/autorun"
require "minitest/pride"

require "byebug"
require 'webmock/minitest'

WebMock.disable_net_connect!(allow_localhost: true)