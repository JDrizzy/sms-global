module SmsGlobal
  module Object
    class Sms < Base
      OBJECT = 'sms'.freeze

      OBJECT_METHODS = [
        :get,
        :post,
        :delete
      ].freeze

      def send(params = {})
        post(params)
      end
    end
  end
end
