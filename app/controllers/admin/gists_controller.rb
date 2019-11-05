# Gist Controller
class Admin::GistsController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @gists = Gist.all.paginate(page: params[:page], per_page: 3)
  end
end
