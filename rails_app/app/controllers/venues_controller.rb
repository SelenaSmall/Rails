class VenuesController < VenueLayoutController
  before_action :set_organisation
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_action :set_hour
  before_action :set_cover
  before_action :set_note
  before_action :set_grid
  before_action :set_plan
  
  # GET /tabs
  # GET /tabs.json
  def index
#    @venues = Venue.all
    @venues = @organisation.venues.all
  end

  def index_venue
#    @venues = Venue.all
    @venues = @organisation.venues.all
  end

  def bookings
    @venues = Venue.all
  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show
  # @hours = @venue.hours.all
  end

  def opening_hours
  end

  def covers
  end

  def notes
  end

  # GET /tabs/new
  def new
#    @venue = Venue.new
    @venue = @organisation.venues.build
  end

  # GET /tabs/1/edit
  def edit
  end

  # POST /tabs
  # POST /tabs.json
  def create
#    @venue = venue.new(venue_params)
    @venue = @organisation.venues.build(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to [@organisation, @venue], notice: 'venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabs/1
  # PATCH/PUT /tabs/1.json
  def update
    #binding.pry
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to [@organisation, @venue], notice: 'venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :edit }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to organisation_venues_path(@organisation), notice: 'venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:organisation_id])
    end

    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:name, :phone, :email, :address)
    end

    def set_hour
      @hour #= Hour.find(params[:id])
    end

    def set_cover
      @cover #= Hour.find(params[:id])
    end

    def set_note
      @note #= Hour.find(params[:id])
    end

    def set_grid
      @grid #= Hour.find(params[:id])
    end

    def set_plan
      @plan #= Hour.find(params[:id])
    end

    #def hour_params
    #  params.require(:opening_hours).permit(:day, :open_time, :close_time, :interval, :covers_per_interval)
    #end
end


