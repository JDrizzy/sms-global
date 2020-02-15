# frozen_string_literal: true

require 'test_helper'
# rake test TEST=test/sms_global/object/group_test.rb

class SmsGlobal::Object::GroupTest < MiniTest::Test
  def setup
    @client = SmsGlobal::Client.new(
      key: '123fake',
      secret: '123fake'
    )
  end

  def test_all
    stub_request(:get, /group/)
      .to_return(
        status: 200,
        body: {
          groups: [
            {
              id: 1,
              name: 'group 1',
              keyword: 'test',
              isGlobal: false,
              contactCount: 1,
              defaultOrigin: '0411111111'
            }
          ]
        }.to_json
      )

    response = @client.group.all
    assert_equal response[:groups].first[:id], 1
  end

  def test_find
    test_id = 2
    stub_request(:get, %r{group/#{test_id}})
      .to_return(
        status: 200,
        body: {
          id: test_id,
          name: 'group 2',
          keyword: 'test',
          isGlobal: false,
          contactCount: 1,
          defaultOrigin: '0411111111'
        }.to_json
      )

    response = @client.group.find(test_id)
    assert_equal response[:name], 'group 2'
  end

  def test_create
    stub_request(:post, /group/)
      .to_return(
        status: 200,
        body: {
          name: 'group 3',
          keyword: 'test',
          isGlobal: false,
          defaultOrigin: '0422222222'
        }.to_json
      )

    response = @client.group.create(
      name: 'group 3',
      keyword: 'test',
      isGlobal: false,
      defaultOrigin: '0422222222'
    )
    assert_equal response[:name], 'group 3'
  end

  def test_update
    test_id = 3
    stub_request(:patch, /group/)
      .to_return(
        status: 200,
        body: {
          name: 'group 4',
          keyword: 'test',
          isGlobal: false,
          defaultOrigin: '0422222222'
        }.to_json
      )

    response = @client.group.update(test_id,
                                    name: 'group 4',
                                    keyword: 'testing',
                                    isGlobal: true,
                                    defaultOrigin: '0433333333')
    assert_equal response[:name], 'group 4'
  end
end
