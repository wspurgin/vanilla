class ThingsController < ApplicationController
  def index
    things = index_params[:ids].map do |id|
      {
        id: id,
        name: "Thing #{id}"
      }
    end

    render json: { things: things }
  end

  def index_params
    params.require(ids: [])
  end
end
