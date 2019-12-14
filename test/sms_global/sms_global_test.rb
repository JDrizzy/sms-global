require "test_helper"

class SmsGlobalTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil SmsGlobal::VERSION
  end
end
