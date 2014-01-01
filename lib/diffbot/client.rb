module Diffbot

  # Knows how ot comunicate with the Diffbot API.
  class Client

    # Diffbot::Client.new(token: 'N7228A...B2OGYy')
    def initialize( options = {} )
      @token = options[:token]
      @base_uri = "http://api.diffbot.com/v2"
      @conn = Faraday.new(@base_uri) do |f|
        f.headers['Accept'] = 'application/json'

        # encodes ruby Hashes/Arrays in POST bodies as "application/json"
        # f.request :json

        # decodes string responses as JSON and rashifies the resulting Hash/Array
        f.response :rashify
        f.response :json

        f.response :logger
        f.adapter Faraday.default_adapter
      end
    end

    # Generates a GET to the API.
    #
    # @return [Diffbot::Entity]
    def get(path, opts = {})
      @conn.get(path)
    end

    def article(url)
      response = get("article?#{params(url: url, token: @token)}")
      Diffbot::Response.new(body(response))
    end
  
    private

      def body(response)
        response.body
      end
    
      def handle_response(response)
        raise_errors(response)
        mashup(response)
      end

      def raise_errors(response)
      end

      # Returns parameters for a URL.
      # 
      # @param [Hash] {a: 'b', c: 'd'}
      # @return [String] a=b&c=d
      def params(hash)
        array = []
        hash.each do |k,v|
          array << "#{k}=#{v}"
        end
        array.join("&")
      end

      # Sets the request headers using parameters.
      # 
      # @param [Hash] Parameters
      # @return [Hash] Header
      def request_headers(opts = {})
        if @session_key.empty?
          @session_key = opts[:session_key]
        end
        opts
      end

      def mashup(response)
        Diffbot::Response.new(body(response))
      end
  end
end
