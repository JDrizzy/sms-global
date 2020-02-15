# frozen_string_literal: true

module SmsGlobal
  module Object
    class VerifiedNumber < Base
      OBJECT = 'user/verified-numbers'

      OBJECT_METHODS = %i[
        get
      ].freeze
    end
  end
end
