module SmsGlobal
  module Object
    class SmsIncoming < Base
      OBJECT = 'sms-incoming'.freeze

      OBJECT_METHODS = [
        :get,
        :delete
      ].freeze
    end
  end
end
