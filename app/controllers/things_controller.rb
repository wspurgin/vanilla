class ThingsController < ApplicationController
  def index
    things = ids.map do |id|
      {
        id: id,
        name: "Thing #{id}"
      }
    end

    render json: { things: things }
  end

  def ids
    params.permit(ids: []).require(:ids)
  end
end
