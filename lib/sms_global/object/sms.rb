# frozen_string_literal: true

module SmsGlobal
  module Object
    class Sms < Base
      OBJECT = 'sms'

      OBJECT_METHODS = %i[
        get
        post
        delete
      ].freeze

      def send(params = {})
        post(params)
      end
    end
  end
end
