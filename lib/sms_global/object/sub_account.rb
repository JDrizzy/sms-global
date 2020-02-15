# frozen_string_literal: true

module SmsGlobal
  module Object
    class SubAccount < Base
      OBJECT = 'user/sub-account'

      OBJECT_METHODS = %i[
        post
      ].freeze
    end
  end
end
