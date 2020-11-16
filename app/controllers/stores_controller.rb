# frozen_string_literal: true

class StoresController < ApplicationController
  def index
    render json: Store.all
  end
end
