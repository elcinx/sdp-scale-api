module Api
  module V1
    class QuestionsController < ApplicationController
      # /api/v1/scales/:scale_id/questions
      def index
        render json: Question.where(scale_id: params[:scale_id]).order(:created_at)
      end

      def show
        render json: Question.find(params[:id]).as_json(include: :responses)
      end

      def create
        q = Question.new(question_params.merge(scale_id: params[:scale_id]))
        if q.save
          render json: q, status: :created
        else
          render json: { errors: q.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        q = Question.find(params[:id])
        if q.update(question_params)
          render json: q
        else
          render json: { errors: q.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        Question.find(params[:id]).destroy
        head :no_content
      end

      private
      def question_params
        params.require(:question).permit(:item_code, :text, :response_type, :options)
      end
    end
  end
end
