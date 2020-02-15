# frozen_string_literal: true

require 'test_helper'

class SmsGlobalTest < Minitest::Test
  def test_library_has_a_version_number
    refute_nil SmsGlobal::VERSION
  end
end
