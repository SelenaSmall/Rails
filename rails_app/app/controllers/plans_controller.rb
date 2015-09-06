class PlansController < VenueLayoutController
  before_action :set_organisation
  before_action :set_venue
  before_action :set_tables

  def index
    @organisations = Organisation.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:organisation_id])
    end

    def set_venue
      @venue = Venue.find(params[:venue_id])
    end

    def set_plan
      @plan = Plan.find(params[:id])
    end

#    def report_params
#      params.require(:plan).permit()
#    end
end
