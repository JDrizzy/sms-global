require 'net/http'
require 'digest'
require 'openssl'
require 'base64'

module SmsGlobal
  module Object
    class Request

      def self.get(client, url, action, params)
        request(:get, client, url, action, params)
      end

      def self.post(client, url, action, params)
        request(:post, client, url, action, params)
      end

      def self.patch(client, url, action, params)
        request(:patch, client, url, action, params)
      end

      def self.delete(client, url, action)
        request(:delete, client, url, action)
      end

      private

      def self.request(method, client, url, action, params = {})
        send do
          uri = URI("https://#{url}")
          https = Net::HTTP.new(uri.host, uri.port);
          https.use_ssl = true
          request = Object.const_get("Net::HTTP::#{method.to_s.capitalize}").new(uri)
          request['Content-Type'] = 'application/json'
          request['Accept'] = 'application/json'
          request['Authorization'] = build_authorization(client, method, action)
          request.body = convert(params) if method == :post || method == :patch

          https.request(request)
        end
      end

      # https://www.smsglobal.com/rest-api/#authentication
      def self.build_authorization(client, method, action)
        timestamp = Time.now.to_i
        nonce = Digest::MD5.hexdigest((rand(36**7...36**8).to_s(36)))
        raw = "#{timestamp}\n#{nonce}\n#{method.to_s.upcase}\n#{action}\n#{client.url}\n443\n\n"
        
        sha_digest = OpenSSL::Digest.new("sha256")
        hash = OpenSSL::HMAC.digest(sha_digest, client.secret, raw)
        hash = Base64::strict_encode64(hash);

        return "MAC id=\"%s\",ts=\"%s\",nonce=\"%s\",mac=\"%s\"" % [client.key, timestamp, nonce, hash]
      end

      def self.convert(request = {})
        result = {}
        request.each do |key, value|
          result[key.to_s.to_camel_case] = value 
        end

        return result.to_json
      end

      def self.send
        begin
          request = yield
          response = Response.new(request.read_body.to_s).results

          if Response.success?(request.code.to_i)
            return response
          elsif Response.deleted?(request.code.to_i)
            return true
          elsif Response.unauthorized?(request.code.to_i)
            raise UnauthorizedException.new
          else
            raise ApiException.new("#{request.code} - API call failed")
          end
        end
      end
    end
  end
end