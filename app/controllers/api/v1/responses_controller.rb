module Api
  module V1
    class ResponsesController < ApplicationController
      def index
        render json: Response.where(question_id: params[:question_id]).order(:created_at)
      end

      def create
        response = Response.new(response_params.merge(question_id: params[:question_id]))
        if response.save
          render json: response, status: :created
        else
          render json: { errors: response.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private
      def response_params
        params.require(:response).permit(
          :answer, :submitted_at, :respondent_id, :meta, :survey_id, :user_id
        )
      end
    end
  end
end