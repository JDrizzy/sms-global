module SmsGlobal
  module Object
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def find(id)
        get(id)
      end

      def all(params = {})
        get(nil, params)
      end

      def create(params = {})
        post(params)
      end

      def update(id, params = {})
        patch(id, params)
      end

      def get(id, params = {})
        if method_supported?(:get)
          url, action = build_url(child_path: object_name, child_id: id)
          Request.get(@client, url, action, params)
        else
          raise SmsGlobal::NoSupportedMethod.new(:get, object_methods)
        end
      end

      def post(params = {})
        if method_supported?(:post)
          url, action = build_url(child_path: object_name)
          Request.post(@client, url, action, params)
        else
          raise SmsGlobal::NoSupportedMethod.new(:post, object_methods)
        end
      end

      def patch(id, params = {})
        if method_supported?(:patch)
          url, action = build_url(child_path: object_name, child_id: id)
          Request.patch(@client, url, action, params)
        else
          raise SmsGlobal::NoSupportedMethod.new(:patch, object_methods)
        end
      end

      def delete(id)
        if method_supported?(:delete)
          url, action = build_url(child_path: object_name, child_id: id)
          Request.delete(@client, url, action)
        else
          raise SmsGlobal::NoSupportedMethod.new(:delete, object_methods)
        end
      end

      private

      def object_name
        self.class.const_get(:OBJECT)
      end

      def object_methods
        self.class.const_get(:OBJECT_METHODS)
      end

      def method_supported?(method)
        return true if object_methods.include?(method)
        return false
      end

      def build_url(child_path: '', child_id: '')
        url = url_builder(child_path, child_id)
        action = action_builder(child_path, child_id)
        return url, action
      end

      def url_builder(child_path = '', child_id = '')
        url = "#{@client.url}/#{client.api_version}"
        url += "/#{child_path}" if !child_path.to_s.blank?
        url += "/#{child_id}" if !child_id.to_s.blank?
        return url
      end

      def action_builder(child_path = '', child_id = '')
        action = "/#{client.api_version}"
        action += "/#{child_path}" if !child_path.to_s.blank?
        action += "/#{child_id}" if !child_id.to_s.blank?
        return action
      end
    end
  end
end