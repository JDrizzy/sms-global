module SmsGlobal
  module Object
    class SmsIncoming < Base
      OBJECT = 'sms-incoming'.freeze

      OBJECT_METHODS = [
        :get,
        :delete
      ].freeze

      def find(id)
        get(id)
      end

      def all(params = {})
        get(nil, params)
      end

      def delete(id)
        super(id)
      end
    end
  end
end
