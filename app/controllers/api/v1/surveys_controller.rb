module Api
  module V1
    class SurveysController < ApplicationController
      # /api/v1/scales/:scale_id/surveys
      def index
        render json: Survey.where(scale_id: params[:scale_id]).order(created_at: :desc)
      end

      def show
        render json: Survey.find(params[:id]).as_json(include: :responses)
      end

      def create
        survey = Survey.new(survey_params.merge(scale_id: params[:scale_id]))
        if survey.save
          render json: survey, status: :created
        else
          render json: { errors: survey.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        s = Survey.find(params[:id])
        if s.update(survey_params)
          render json: s
        else
          render json: { errors: s.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        Survey.find(params[:id]).destroy
        head :no_content
      end

      private
      def survey_params
        params.require(:survey).permit(:title, :status, :distribution_mode, :start_at, :end_at, :user_id)
      end
    end
  end
end
