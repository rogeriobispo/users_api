# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def index
      render json: { users: search_user_service_perform.users }, status: :ok
    end

    def create
      service = create_user_service_perform
      if service.success?
        render json: service.user, status: :created
      else
        render json: { errors: service.errors }, status: :unprocessable_entity
      end
    end

    private

    def users_params
      params.permit(:email, :phone_number, :full_name, :password, :metadata, :q)
    end

    def create_user_service_perform
      Users::CreateService.perform(users_params)
    end

    def search_user_service_perform
      Users::SearchService.perform(users_params[:q])
    end
  end
end
