# frozen_string_literal: true

module SmsGlobal
  module Object
    class LowBalanceAlert < Base
      OBJECT = 'user/low-balance-alerts'

      OBJECT_METHODS = %i[
        get
        put
      ].freeze
    end
  end
end
