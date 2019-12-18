module SmsGlobal
  module Object
    class Contact < Base
      OBJECT = 'contact'.freeze

      OBJECT_METHODS = [
        :get,
        :patch,
        :delete
      ].freeze
    end
  end
end
