class CnabsController < ApplicationController
  def index
    store = Store.find(params.permit(:store_id))

    render json: store.cnabs
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Loja não encontrada' }, status: :not_found
  end

  def create
    Cnabs::ParseFile.call(params.permit(file))

    render json: status: :success
  rescue StandardError
    render json: { message: e.message }, status: :error
  end
end
