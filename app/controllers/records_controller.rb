class RecordsController < ApplicationController

  def index
    records = Record.all
    render json: records, except: [:created_at, :updated_at]
  end

end
