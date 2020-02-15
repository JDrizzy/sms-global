# frozen_string_literal: true

module SmsGlobal
  module Object
    class Group < Base
      OBJECT = 'group'

      OBJECT_METHODS = %i[
        get
        post
        delete
        patch
      ].freeze
    end

    def contacts(group_id, params = {})
      url, action = build_url(child_path: "group/#{group_id}/contacts")
      Request.get(@client, url, action, params)
    end

    def create_contact(group_id, params = {})
      url, action = build_url(child_path: "group/#{group_id}/contact")
      Request.post(@client, url, action, params)
    end
  end
end
