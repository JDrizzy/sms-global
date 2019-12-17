module SmsGlobal
  module Object
    class Sms < Base
      OBJECT = 'sms'.freeze

      OBJECT_METHODS = [
        :get,
        :post,
        :delete
      ].freeze

      def find(id)
        get(id)
      end

      def all(params = {})
        get(nil, params)
      end

      def send(params = {})
        post(params)
      end

      def delete(id)
        super(id)
      end
    end
  end
end
