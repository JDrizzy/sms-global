require "test_helper"
# rake test TEST=test/sms_global/object/contact_test.rb

class SmsGlobal::Object::ContactTest < MiniTest::Test
  def setup
    @client = SmsGlobal::Client.new(
      key: '123fake',
      secret: '123fake'
    )
  end

  def test_find
    test_id = 1

    stub_request(:get, /contact\/(#{test_id})/)
      .to_return(
        status: 200, 
        body: {
          givenName: 'Jarrad',
          familyName: 'Muir',
          displayName: 'Jarrad Muir',
          msisdn: '0411111111',
          emailAddress: 'email@email.com'
        }.to_json
      )
    
    response = @client.contact.find(test_id)
    assert_equal response[:given_name], 'Jarrad'
  end

  def test_update
    test_id = 1

    stub_request(:patch, /contact\/(#{test_id})/)
      .to_return(
        status: 200, 
        body: {
          givenName: 'Jrad',
          familyName: 'Muir',
          displayName: 'Jarrad Muir',
          msisdn: '0411111111',
          emailAddress: 'email@email.com'
        }.to_json
      )
    
    response = @client.contact.update(test_id, {
      given_name: 'Jrad'
    })
    assert_equal response[:given_name], 'Jrad'
  end

  def test_delete
    test_id = 3

    stub_request(:delete, /contact\/(#{test_id})/)
      .to_return(status: 204, body: "")
    
    assert @client.contact.delete(test_id)
  end
end