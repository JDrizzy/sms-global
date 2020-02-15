# frozen_string_literal: true

module SmsGlobal
  module Object
    class OptOut < Base
      OBJECT = 'opt-outs'

      OBJECT_METHODS = %i[
        get
        post
        delete
      ].freeze

      def validate(params = {})
        url, action = build_url(child_path: 'opt-outs/validate')
        Request.post(@client, url, action, params)
      end
    end
  end
end
