# frozen_string_literal: true

module SmsGlobal
  module Object
    class Contact < Base
      OBJECT = 'contact'

      OBJECT_METHODS = %i[
        get
        patch
        delete
      ].freeze
    end
  end
end
