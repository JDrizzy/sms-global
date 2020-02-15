# frozen_string_literal: true

require 'test_helper'
# rake test TEST=test/sms_global/object/credit_balance_test.rb

class SmsGlobal::Object::CreditBalanceTest < MiniTest::Test
  def setup
    @client = SmsGlobal::Client.new(
      key: '123fake',
      secret: '123fake'
    )
  end

  def test_display
    stub_request(:get, /credit-balance/)
      .to_return(
        status: 200,
        body: {
          balance: 20,
          currency: 'AUD'
        }.to_json
      )

    response = @client.credit_balance.display
    assert_equal response[:balance], 20
  end
end
