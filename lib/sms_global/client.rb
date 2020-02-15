# frozen_string_literal: true

module SmsGlobal
  class Client
    extend SmsGlobal::Object::Helper

    URL = 'api.smsglobal.com'

    attr_reader :key,
                :secret,
                :url,
                :api_version

    object :auto_topup
    object :contact
    object :group
    object :sms
    object :sms_incoming
    object :shared_pool
    object :dedicated_number
    object :credit_balance
    object :verified_number
    object :sub_account
    object :low_balance_alert
    object :opt_out

    def initialize(options = {})
      opts = options.dup
      @key = opts.delete(:key)
      @secret = opts.delete(:secret)
      @url = opts.delete(:url) || URL
      @api_version = 'v2'
    end
  end
end
