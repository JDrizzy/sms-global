# frozen_string_literal: true

require 'json'

module SmsGlobal
  module Object
    class Response
      attr_reader :results

      def initialize(response)
        return if response.blank?

        @results = nil
        @response = JSON.parse(response, symbolize_names: true)
        @response = @response[:value] if @response.key?(:value)
        process
      end

      def self.success?(status)
        [200, 201].include?(status)
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
          result[convert_to_snake_case_symbol(key)] = if value.is_a?(Hash)
                                                        convert(value)
                                                      else
                                                        value
                                                      end
        end

        result
      end

      def convert_to_snake_case_symbol(value)
        value.to_s.to_snake_case.to_sym
      end
    end
  end
end
