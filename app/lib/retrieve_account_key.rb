# frozen_string_literal: true

class RetrieveAccountkey
  def initialize(http_provider = HTTParty)
    @http_provider = http_provider
  end

  def perform(email, key)
    parsed_response = http_post({ email: email, key: key }).parsed_response.with_indifferent_access
    {
      email: parsed_response[:email],
      account_key: parsed_response[:account_key]
    }
  end

  private

  def account_key_url
    ENV['ACCOUNT_KEY_URL']
  end

  def http_post(body)
    @http_provider.post(account_key_url, body: body.to_json)
  end
end
