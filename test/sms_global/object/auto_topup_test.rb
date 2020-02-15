# frozen_string_literal: true

require 'test_helper'
# rake test TEST=test/sms_global/object/auto_topup_test.rb

class SmsGlobal::Object::AutoTopupTest < MiniTest::Test
  def setup
    @client = SmsGlobal::Client.new(
      key: '123fake',
      secret: '123fake'
    )
  end

  def test_all
    stub_request(:get, /auto-topup/)
      .to_return(
        status: 200,
        body: {
          disabled: false,
          balanceThreshold: 10,
          balanceAmount: 100
        }.to_json
      )

    response = @client.auto_topup.all
    assert_equal response[:balance_threshold], 10
  end
end
