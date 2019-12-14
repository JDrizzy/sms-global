module SmsGlobal
  class Client
    extend SmsGlobal::Object::Helper

    URL = 'api.smsglobal.com'.freeze

    attr_reader :key,
                :secret,
                :url,
                :api_version

    object :sms

    def initialize(options = {})
      opts = options.dup
      @key = opts.delete(:key)
      @secret = opts.delete(:secret)
      @url = opts.delete(:url) || URL
      @api_version = 'v2'
    end
  end
end