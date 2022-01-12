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
        Result::Success.new(user: user)
      else
        Result::Failure.new(errors: user.errors.full_messages)
      end
    end

    private

    def key
      SecureRandom.hex
    end
  end
end
