# frozen_string_literal: true

module Users
  class CreateService < Aldous::Service
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def perform
      user = User.new(params.merge(key: key))
      if user.save
        retrieve_account_key(user.id)
        Result::Success.new(user: user.attributes.except('updated_at', 'created_at'))
      else
        Result::Failure.new(errors: user.errors.full_messages)
      end
    end

    private

    def key
      SecureRandom.hex
    end

    def retrieve_account_key(user_id)
      RetrieveAccountKeyJob.perform_later(user_id)
    end
  end
end
