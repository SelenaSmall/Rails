class RunsheetController < VenueLayoutController
  before_action :set_tables

  def index
    @organisations = Organisation.all
  end

  private
    def runsheet
      @runsheet = Runsheet.find(params[:id])
    end

end
