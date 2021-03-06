# frozen_string_literal: true

module SmsGlobal
  module Object
    class SmsIncoming < Base
      OBJECT = 'sms-incoming'

      OBJECT_METHODS = %i[
        get
        delete
      ].freeze
    end
  end
end
