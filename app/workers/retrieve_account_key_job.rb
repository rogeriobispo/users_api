# frozen_string_literal: true

class RetrieveAccountKeyJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    response = RetrieveAccountkey.new.perform(user.email, user.key)
    user.update(account_key: response[:account_key])
  end
end
