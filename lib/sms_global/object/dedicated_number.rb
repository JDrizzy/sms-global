# frozen_string_literal: true

module SmsGlobal
  module Object
    class DedicatedNumber < Base
      OBJECT = 'dedicated-number'

      OBJECT_METHODS = [
        :get
      ].freeze
    end
  end
end
