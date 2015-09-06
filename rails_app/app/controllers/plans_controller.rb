class PlansController < VenueLayoutController
  before_action :set_tables

  def index
    @organisations = Organisation.all
  end

  private
    def set_plan
      @plan = Plan.find(params[:id])
    end

end
