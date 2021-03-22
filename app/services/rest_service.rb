# frozen_string_literal: true

require 'rest-client'
require 'json'

class RestService
  attr_reader :base_url

  def initialize
    @base_url = 'http://cep.la/'
  end

  def headers
    {
      'Accept': 'application/json',
      'Content-type': 'application/json'
    }
  end

  def send(data)
    url = @base_url + data
    request = RestClient.get(url, headers)
    JSON.parse(request.body)
  end

end
