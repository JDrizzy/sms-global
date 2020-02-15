# frozen_string_literal: true

module SmsGlobal
  module Object
    class ContactDetails < Base
      OBJECT = 'user/contact-details'

      OBJECT_METHODS = %i[
        get
        put
      ].freeze
    end
  end
end
