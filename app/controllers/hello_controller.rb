class HelloController < ApplicationController
  def index
    render json: { message: "hello" }, status: :ok
  end
end
