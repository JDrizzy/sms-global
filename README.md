# SMS Global API Library

This library is designed to help your ruby/rails based application communicate with SMS global.

https://www.smsglobal.com/rest-api/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sms-global'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sms-global

## Usage

```Ruby
require 'sms_global'

client = SmsGlobal::Client.new(
  key: "<key>",
  secret: "<secret>"
)

# Retrieve all SMS messages
client.sms.all

# Send SMS message
client.sms.send({
    destination: '0411111111',
    message: 'hello world',
    origin: '0422222222'
})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JDrizzy/sms-global.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
