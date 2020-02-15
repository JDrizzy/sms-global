# frozen_string_literal: true

module SmsGlobal
  module Object
    class BillingDetails < Base
      OBJECT = 'user/billing-details'

      OBJECT_METHODS = %i[
        get
        put
      ].freeze
    end
  end
end
