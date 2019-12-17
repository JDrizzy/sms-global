module SmsGlobal
  module Object
    class SharedPool < Base
      OBJECT = 'sharedpool'.freeze

      OBJECT_METHODS = [
        :get
      ].freeze

      def find(id)
        get(id)
      end

      def all(params = {})
        get(nil, params)
      end
    end
  end
end
