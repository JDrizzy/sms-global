module SmsGlobal
  module Object
    class DedicatedNumber < Base
      OBJECT = 'dedicated-number'.freeze

      OBJECT_METHODS = [
        :get
      ].freeze
    end
  end
end
