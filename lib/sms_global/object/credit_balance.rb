# frozen_string_literal: true

module SmsGlobal
  module Object
    class CreditBalance < Base
      OBJECT = 'user/credit-balance'

      OBJECT_METHODS = %i[
        get
      ].freeze

      def display
        all
      end
    end
  end
end
