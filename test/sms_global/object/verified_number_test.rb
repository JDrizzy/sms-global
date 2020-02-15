# frozen_string_literal: true

require 'test_helper'
# rake test TEST=test/sms_global/object/verified_number_test.rb

class SmsGlobal::Object::VerifiedNumberTest < MiniTest::Test
  def setup
    @client = SmsGlobal::Client.new(
      key: '123fake',
      secret: '123fake'
    )
  end

  def test_all
    stub_request(:get, /verified-numbers/)
      .to_return(
        status: 200,
        body: {
          numbers: [
            '0411111111'
          ]
        }.to_json
      )

    response = @client.verified_number.all
    assert_equal response[:numbers].first, '0411111111'
  end
end
