class ReportsController < VenueLayoutController
  before_action :set_organisation
  before_action :set_venue

  def index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:organisation_id])
    end

    def set_venue
      @venue = Venue.find(params[:venue_id])
    end

    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit()
    end
end
