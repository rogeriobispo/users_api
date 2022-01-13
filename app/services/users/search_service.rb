# frozen_string_literal: true

module Users
  class SearchService < Aldous::Service
    attr_reader :term

    def initialize(term)
      @term = term&.downcase
    end

    def perform
      Result::Success.new(users: search_user)
    end

    def search_user
      User.all if term.blank?
      User.where(
        'LOWER(metadata) LIKE ? OR LOWER(email) LIKE ? OR LOWER(full_name) LIKE ?',
        "%#{term}%", "%#{term}%", "#{term}%"
      )
    end
  end
end
