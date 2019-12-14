require "test_helper"
# rake test TEST=test/sms_global/object/sms_test.rb

class SmsGlobal::Object::SmsTest < MiniTest::Test
  def setup
    @client = SmsGlobal::Client.new(
      key: '123fake',
      secret: '123fake'
    )
  end

  def test_all
    stub_request(:get, /sms/)
      .to_return(
        status: 200, 
        body: {
          messages: [
            {
              id: 1,
              outgoing_id: 1,
              origin: '123',
              destination: '123',
              message: 'hello world',
              status: 'delivered',
              dateTime: ''
            }
          ]
        }.to_json
      )

    
    response = @client.sms.all
    assert_equal response[:messages].first[:id], 1
  end

  def test_send
    stub_request(:post, /sms/)
      .to_return(
        status: 200, 
        body: {
          messages: [
            {
              id: 2,
              outgoing_id: 2,
              origin: '123',
              destination: '123',
              message: 'hello world',
              status: 'delivered',
              dateTime: ''
            }
          ]
        }.to_json
      )

    response = @client.sms.send({
      origin: '123',
      destination: '123',
      message: 'hello'
    })
    assert_equal response[:messages].first[:id], 2
  end
end