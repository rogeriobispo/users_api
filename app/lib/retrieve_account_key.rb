# frozen_string_literal: true

class RetrieveAccountkey
  def initialize(http_provider = HTTParty)
    @http_provider = http_provider
  end

  def perform(email, key)
    account_key_url = ENV['ACCOUNT_KEY_URL']
    body = { email: email, key: key }.to_json
    parsed_response = @http_provider.post(account_key_url, body: body).parsed_response.with_indifferent_access
    {
      email: parsed_response[:email],
      account_key: parsed_response[:account_key]
    }
  end
end
