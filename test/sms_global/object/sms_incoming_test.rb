# frozen_string_literal: true

require 'test_helper'
# rake test TEST=test/sms_global/object/sms_incoming_test.rb

class SmsGlobal::Object::SmsIncomingTest < MiniTest::Test
  def setup
    @client = SmsGlobal::Client.new(
      key: '123fake',
      secret: '123fake'
    )
  end

  def test_find
    test_id = 1

    stub_request(:get, %r{sms-incoming/(#{test_id})})
      .to_return(
        status: 200,
        body: {
          id: test_id,
          origin: '123',
          destination: '123',
          message: 'hello world',
          status: 'delivered',
          dateTime: ''
        }.to_json
      )

    response = @client.sms_incoming.find(test_id)
    assert_equal response[:id], test_id
  end

  def test_all
    stub_request(:get, /sms-incoming/)
      .to_return(
        status: 200,
        body: {
          messages: [
            {
              id: 2,
              origin: '123',
              destination: '123',
              message: 'hello world',
              status: 'delivered',
              dateTime: ''
            }
          ]
        }.to_json
      )

    response = @client.sms_incoming.all
    assert_equal response[:messages].first[:id], 2
  end

  def test_delete
    test_id = 3

    stub_request(:delete, %r{sms-incoming/(#{test_id})})
      .to_return(status: 204, body: '')

    assert @client.sms_incoming.delete(test_id)
  end
end
