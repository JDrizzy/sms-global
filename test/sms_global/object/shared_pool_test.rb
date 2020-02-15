# frozen_string_literal: true

require 'test_helper'
# rake test TEST=test/sms_global/object/shared_pool_test.rb

class SmsGlobal::Object::SharedPoolTest < MiniTest::Test
  def setup
    @client = SmsGlobal::Client.new(
      key: '123fake',
      secret: '123fake'
    )
  end

  def test_find
    test_id = 1

    stub_request(:get, %r{sharedpool/(#{test_id})})
      .to_return(
        status: 200,
        body: {
          id: test_id,
          name: 'name 1',
          size: 1,
          numbers: ['041111111']
        }.to_json
      )

    response = @client.shared_pool.find(test_id)
    assert_equal response[:id], test_id
  end

  def test_all
    stub_request(:get, /sharedpool/)
      .to_return(
        status: 200,
        body: {
          SharedPools: [
            {
              id: 2,
              name: 'name 2',
              size: 1,
              numbers: ['041111111']
            }
          ]
        }.to_json
      )

    response = @client.shared_pool.all
    assert_equal response[:shared_pools].first[:id], 2
  end
end
