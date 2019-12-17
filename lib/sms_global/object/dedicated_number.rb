module SmsGlobal
  module Object
    class DedicatedNumber < Base
      OBJECT = 'dedicated-number'.freeze

      OBJECT_METHODS = [
        :get
      ].freeze

      def all(params = {})
        get(nil, params)
      end
    end
  end
end
