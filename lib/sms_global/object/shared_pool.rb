module SmsGlobal
  module Object
    class SharedPool < Base
      OBJECT = 'sharedpool'.freeze

      OBJECT_METHODS = [
        :get
      ].freeze
    end
  end
end
