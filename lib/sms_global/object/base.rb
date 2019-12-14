module SmsGlobal
  module Object
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def get(params = {})
        if method_supported?(:get)
          Request.get(@client, build_url(child_path: object_name), object_name, params)
        else
          raise SmsGlobal::NoSupportedMethod.new(:get, object_methods)
        end
      end

      def post(params = {})
        if method_supported?(:post)
          Request.post(@client, build_url(child_path: object_name), object_name, params)
        else
          raise SmsGlobal::NoSupportedMethod.new(:post, object_methods)
        end
      end

      def patch(id, params = {})
        if method_supported?(:patch)
          Request.patch(@client, build_url(child_path: object_name, child_id: id), object_name, params)
        else
          raise SmsGlobal::NoSupportedMethod.new(:patch, object_methods)
        end
      end

      def delete(id)
        if method_supported?(:delete)
          Request.delete(@client, build_url(child_path: object_name), object_name)
        else
          raise SmsGlobal::NoSupportedMethod.new(:delete, object_methods)
        end
      end

      private

      def object_name
        self.class.const_get(:OBJECT)
      end

      def object_validation
        self.class.const_defined?(:OBJECT_VALIDATION) ? self.class.const_get(:OBJECT_VALIDATION) : []
      end

      def object_methods
        self.class.const_get(:OBJECT_METHODS)
      end

      def method_supported?(method)
        return true if object_methods.include?(method)
        return false
      end

      def build_url(child_path: '', child_id: '')
        url_builder(child_path, child_id)
      end

      def url_builder(child_path = '', child_id = '')
        url = "#{@client.url}/#{client.api_version}"
        url += "/#{child_path}" if !child_path.blank?
        url += "(#{child_id})" if !child_id.blank?
        return url
      end
    end
  end
end