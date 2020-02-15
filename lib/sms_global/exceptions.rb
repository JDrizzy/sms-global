# frozen_string_literal: true

module SmsGlobal
  class SmsGlobalError < StandardError; end

  class ApiException < SmsGlobalError
    def initialize(message)
      @message = message
    end

    attr_reader :message
  end

  class UnauthorizedException < SmsGlobalError
    def message
      'Unauthorized - The credentials provided are incorrect'
    end
  end

  class NoSupportedMethod < SmsGlobalError
    def initialize(method, allowed_methods)
      @method = method
      @allowed_methods = allowed_methods
    end

    def message
      "#{method} method is currently not support. Allowed methods are: #{allowed_methods.join(', ')}"
    end
  end
end
