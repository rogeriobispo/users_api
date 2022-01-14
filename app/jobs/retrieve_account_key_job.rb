# frozen_string_literal: true

class RetrieveAccountKeyJob < ApplicationJob
  queue_as :default
  retry_on Exception, attempts: 3, wait: 3.minutes

  def perform(user_id)
    user = User.find(user_id)
    response = RetrieveAccountkey.new.perform(user.email, user.key)
    user.update(account_key: response[:account_key])
  end
end
