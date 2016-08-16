class Api::V1::IdeasController

  def index
    byebug
    byebug
    # respond_with @ideas
    @ideas = Ideas.order(:created_at)
  end
end
