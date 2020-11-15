class CnabsController < ApplicationController
  def index
    store = Store.find(params[:store_id])

    render json: store.cnabs.to_json(include: [:cnab_type, :store])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Loja não encontrada' }, status: :not_found
  end

  def create
    file = cnab_params[:file].read
    @cnabs = Cnabs::ParseFile.call(file)

    render json: @cnabs, status: :created
  rescue StandardError => e
    render json: { message: e.message }, status: :error
  end

  private

  def cnab_params
    params.require(:cnab).permit(:file)
  end
end
