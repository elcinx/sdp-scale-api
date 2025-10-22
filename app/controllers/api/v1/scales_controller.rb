module Api
  module V1
    class ScalesController < ApplicationController
      def index
        render json: Scale.order(created_at: :desc)
      end

      def show
        scale = Scale.find(params[:id])
        render json: scale.as_json(include: [:questions, :surveys])
      end

      def create
        scale = Scale.new(scale_params)
        if scale.save
          render json: scale, status: :created
        else
          render json: { errors: scale.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        scale = Scale.find(params[:id])
        if scale.update(scale_params)
          render json: scale
        else
          render json: { errors: scale.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        Scale.find(params[:id]).destroy
        head :no_content
      end

      private

      def scale_params
        params.require(:scale).permit(:title, :domain, :version, :sdp_doi, :status, :user_id)
      end
    end
  end
end
