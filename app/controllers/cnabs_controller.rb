# frozen_string_literal: true

class CnabsController < ApplicationController
  def index
    store = Store.find(params[:store_id])

    render json: { cnabs: store.cnabs.to_json(include: %i[cnab_type store]), total_balance: store.total_balance }
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Loja não encontrada' }, status: :not_found
  end

  def create
    file = cnab_params[:file].read
    @cnabs = Cnabs::ParseFile.call(file)

    render json: @cnabs.to_json, status: :created
  rescue StandardError => e
    render json: { message: e.message }, status: :error
  end

  private

  def cnab_params
    params.require(:cnab).permit(:file)
  end
end
