require "test_helper"
# rake test TEST=test/sms_global/object/dedicated_number_test.rb

class SmsGlobal::Object::DedicatedNumberTest < MiniTest::Test
  def setup
    @client = SmsGlobal::Client.new(
      key: '123fake',
      secret: '123fake'
    )
  end

  def test_all
    stub_request(:get, /dedicated-number/)
      .to_return(
        status: 200, 
        body: {
          dedicatedNumbers: [
            {
              id: 1,
              userId: 1
            }
          ]
        }.to_json
      )

    
    response = @client.dedicated_number.all
    assert_equal response[:dedicated_numbers].first[:id], 1
  end
end