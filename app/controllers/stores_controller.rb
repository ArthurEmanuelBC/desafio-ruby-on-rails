# frozen_string_literal: true

class StoresController < ApplicationController
  def index
    render json: Store.all
  rescue StandardError => e
    render json: { message: e.message }, status: :error
  end
end
