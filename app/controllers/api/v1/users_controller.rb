module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: User.order(created_at: :desc)
      end

      def show
        render json: User.find(params[:id])
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :role)
      end
    end
  end
end
