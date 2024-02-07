# #OpenAPI Petstore
#
##This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.
#
#The version of the OpenAPI document: 1.0.0
#
#Generated by: https://openapi-generator.tech
#OpenAPI Generator version: 7.2.0-SNAPSHOT
#

require "json"
require "time"

module Petstore
  class ApiClient
    # The Configuration object holding settings to be used in the API client.
    property config : Configuration

    # Defines the headers to be used in HTTP requests of all API calls by default.
    #
    # @return [Hash]
    property default_headers : Hash(String, String)

    # Initializes the ApiClient
    # @option config [Configuration] Configuration for initializing the object, default to Configuration.default
    def initialize(@config = Configuration.default)
      @user_agent = "OpenAPI-Generator/#{VERSION}/crystal"
      @default_headers = {
        "User-Agent" => @user_agent
      }
    end

    def self.default
      @@default ||= ApiClient.new
    end

    # Check if the given MIME is a JSON MIME.
    # JSON MIME examples:
    #   application/json
    #   application/json; charset=UTF8
    #   APPLICATION/JSON
    #   */*
    # @param [String] mime MIME
    # @return [Boolean] True if the MIME is application/json
    def json_mime?(mime)
      (mime == "*/*") || !(mime =~ /Application\/.*json(?!p)(;.*)?/i).nil?
    end


    def build_request_url(path : String, operation : Symbol)
      # Add leading and trailing slashes to path
      path = "/#{path}".gsub(/\/+/, "/")
      @config.base_url(operation) + path
    end

    # Update header and query params based on authentication settings.
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] query_params Query parameters
    # @param [String] auth_names Authentication scheme name
    def update_params_for_auth!(header_params, query_params, auth_names)
      auth_names.each do |auth_name|
        auth_setting = @config.auth_settings[auth_name]
        next unless auth_setting
        case auth_setting[:in]
        when "header" then header_params[auth_setting[:key]] = auth_setting[:value]
        when "query"  then query_params[auth_setting[:key]] = auth_setting[:value]
        else raise ArgumentError.new("Authentication token must be in `query` of `header`")
        end
      end
    end

    # Sets user agent in HTTP header
    #
    # @param [String] user_agent User agent (e.g. openapi-generator/ruby/1.0.0)
    def user_agent=(user_agent)
      @user_agent = user_agent
      @default_headers["User-Agent"] = @user_agent
    end

    # Return Accept header based on an array of accepts provided.
    # @param [Array] accepts array for Accept
    # @return [String] the Accept header (e.g. application/json)
    def select_header_accept(accepts) : String
      #return nil if accepts.nil? || accepts.empty?
      # use JSON when present, otherwise use all of the provided
      json_accept = accepts.find { |s| json_mime?(s) }
      if json_accept.nil?
        accepts.join(",")
      else
        json_accept
      end
    end

    # Return Content-Type header based on an array of content types provided.
    # @param [Array] content_types array for Content-Type
    # @return [String] the Content-Type header  (e.g. application/json)
    def select_header_content_type(content_types)
      # use application/json by default
      return "application/json" if content_types.nil? || content_types.empty?
      # use JSON when present, otherwise use the first one
      json_content_type = content_types.find { |s| json_mime?(s) }
      json_content_type || content_types.first
    end

    # Build parameter value according to the given collection format.
    # @param [String] collection_format one of :csv, :ssv, :tsv, :pipes and :multi
    def build_collection_param(param, collection_format)
      case collection_format
      when :csv
        param.join(",")
      when :ssv
        param.join(" ")
      when :tsv
        param.join("\t")
      when :pipes
        param.join("|")
      when :multi
        # TODO: Need to fix this
        raise "multi is not supported yet"
      else
        raise "unknown collection format: #{collection_format.inspect}"
      end
    end

    # Call an API with given options.
    #
    # @return [Array<(Object, Integer, Hash)>] an array of 3 elements:
    #   the data deserialized from response body (could be nil), response status code and response headers.
    def call_api(http_method : Symbol, path : String, operation : Symbol, return_type : String?, post_body : String?, auth_names = [] of String, header_params = {} of String => String, query_params = {} of String => String, form_params = {} of Symbol => (String | ::File))
      #ssl_options = {
      #  :ca_file => @config.ssl_ca_file,
      #  :verify => @config.ssl_verify,
      #  :verify_mode => @config.ssl_verify_mode,
      #  :client_cert => @config.ssl_client_cert,
      #  :client_key => @config.ssl_client_key
      #}

      update_params_for_auth! header_params, query_params, auth_names

      if !post_body.nil? && !post_body.empty?
        # use JSON string in the payload
        form_or_body = post_body
      else
        # use HTTP forms in the payload
        # TODO use HTTP form encoding
        form_or_body = form_params
      end

      request = Crest::Request.new(http_method,
        build_request_url(path, operation),
        params: query_params,
        headers: header_params,
        #cookies: cookie_params, # TODO add cookies support
        form: form_or_body,
        logging: @config.debugging,
        handle_errors: false
      )

      response = request.execute

      if @config.debugging
        Log.debug {"HTTP response body ~BEGIN~\n#{response.body}\n~END~\n"}
      end

      if !response.success?
        if response.status == 0
          # Errors from libcurl will be made visible here
          raise ApiError.new(code: 0,
                            message: response.body)
        else
          raise ApiError.new(code: response.status_code,
                            response_headers: response.headers,
                            message: response.body)
        end
      end

      return response.body, response.status_code, response.headers
    end
  end
end
