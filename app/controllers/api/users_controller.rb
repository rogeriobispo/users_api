# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
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
      params.permit(:email, :phone_number, :full_name, :password, :metadata)
    end

    def create_user_service_perform
      Users::CreateService.perform(users_params)
    end
  end
end
