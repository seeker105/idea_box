class Api::V1::IdeasController
  respond_to :json, :html

  def index
    byebug
    @ideas = Ideas.order(:created_at)
    byebug
    respond_with @ideas
  end
end
