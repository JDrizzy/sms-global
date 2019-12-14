module SmsGlobal
  module Object
    class Sms < Base
      OBJECT = 'sms'.freeze

      OBJECT_METHODS = [
        :get,
        :post
      ].freeze

      def all(params = {})
        get(params)
      end

      def send(params = {})
        post(params)
      end
    end
  end
end
