module SmsGlobal
  module Object
    class AutoTopup < Base
      OBJECT = 'auto-topup'.freeze

      OBJECT_METHODS = [
        :get,
        :delete
      ].freeze

      def all(params = {})
        get(nil, params)
      end
    end
  end
end
