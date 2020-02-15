# frozen_string_literal: true

module SmsGlobal
  module Object
    class SharedPool < Base
      OBJECT = 'sharedpool'

      OBJECT_METHODS = [
        :get
      ].freeze
    end
  end
end
