require 'net/http'
require 'openssl'
module URI
  class Uri
    attr_reader :uri
    attr_accessor :response

    def initialize(uri)
      @uri = uri
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl   = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      @response = http.get(@uri.request_uri)
    end
  end
end