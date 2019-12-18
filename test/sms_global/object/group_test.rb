require "test_helper"
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

  def test_create
    stub_request(:post, /sms/)
      .to_return(
        status: 200, 
        body: {
          name: 'group 2',
          keyword: 'test',
          isGlobal: false,
          defaultOrigin: '0422222222'
        }.to_json
      )

    response = @client.group.create({
      name: 'group 2',
      keyword: 'test',
      isGlobal: false,
      defaultOrigin: '0422222222'
    })
    assert_equal response[:name], 'group 2'
  end
end