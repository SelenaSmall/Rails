class GridsController < VenueLayoutController
  before_action :set_tables

  def index
    @organisations = Organisation.all
  end

  private
   def set_grid
      @grid = Grid.find(params[:id])
    end

    def set_tables
      @tables
    end

end
