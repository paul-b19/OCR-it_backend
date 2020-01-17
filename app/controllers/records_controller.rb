class RecordsController < ApplicationController

  # GET /records/
  def index
    records = Record.all
    render json: records, except: [:created_at, :updated_at]
  end

  # GET /records/:id
  def show
    record = Record.find(record_params[:id])
    render json: record, except: [:created_at, :updated_at]
  end

  # POST /records/
  def create
    record = Record.create!(record_params)
    render json: record, except: [:created_at, :updated_at]
  end

  # PUT /records/:id
  def update
    record = Record.find(record_params[:id])
    record.update(record_params)
    render json: record, except: [:created_at, :updated_at]
  end

  private
  
  def record_params
    params.permit(:id, :group, :title, :body, :confidence, :user_id)
  end

end






