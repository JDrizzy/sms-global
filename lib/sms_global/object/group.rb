module SmsGlobal
  module Object
    class Group < Base
      OBJECT = 'group'.freeze

      OBJECT_METHODS = [
        :get,
        :post,
        :delete,
        :patch
      ].freeze
    end
  end
end
