module SmsGlobal
  module Object
    class AutoTopup < Base
      OBJECT = 'auto-topup'.freeze

      OBJECT_METHODS = [
        :get,
        :delete
      ].freeze
    end
  end
end
