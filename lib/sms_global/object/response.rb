require 'json'

module SmsGlobal
  module Object
    class Response
      attr_reader :results

      def initialize(response)
        @results = nil
        if !response.blank?
          @response = JSON.parse(response, symbolize_names: true)
          if @response.has_key?(:value)
            @response = @response[:value]
          end
          process
        end
      end

      def self.success?(status)
        status == 200 || status == 201
      end

      def self.deleted?(status)
        status == 204
      end

      def self.unauthorized?(status)
        status == 401
      end

      private

      def process
        if @response.is_a?(Array)
          @results = []
          @response.each do |data|
            @results << convert(data)
          end
        elsif @response.is_a?(Hash)
          @results = convert(@response)
        end
      end

      def convert(data)
        result = {}    
        data.each do |key, value|
          if value.is_a?(Hash)
            result[convert_to_snake_case_symbol(key)] = convert(value)
          else
            result[convert_to_snake_case_symbol(key)] = value
          end
        end

        return result
      end

      def convert_to_snake_case_symbol(value)
        value.to_s.to_snake_case.to_sym
      end
    end
  end
end