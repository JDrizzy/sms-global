# frozen_string_literal: true

require 'test_helper'
# rake test TEST=test/sms_global/object/sms_test.rb

class SmsGlobal::Object::SmsTest < MiniTest::Test
  def setup
    @client = SmsGlobal::Client.new(
      key: '123fake',
      secret: '123fake'
    )
  end

  def test_find
    test_id = 1

    stub_request(:get, %r{sms/(#{test_id})})
      .to_return(
        status: 200,
        body: {
          id: test_id,
          outgoing_id: test_id,
          origin: '123',
          destination: '123',
          message: 'hello world',
          status: 'delivered',
          dateTime: ''
        }.to_json
      )

    response = @client.sms.find(test_id)
    assert_equal response[:id], test_id
  end

  def test_all
    stub_request(:get, /sms/)
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

    response = @client.sms.all
    assert_equal response[:messages].first[:id], 2
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

    response = @client.sms.send(
      origin: '123',
      destination: '123',
      message: 'hello'
    )
    assert_equal response[:messages].first[:id], 2
  end

  def test_delete
    test_id = 3

    stub_request(:delete, %r{sms/(#{test_id})})
      .to_return(status: 204, body: '')

    assert @client.sms.delete(test_id)
  end
end
