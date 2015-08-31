class HoursController < VenueLayoutController
  before_action :set_organisation
  before_action :set_venue
  before_action :set_table
  before_action :set_hour, only: [:show, :edit, :update, :destroy]

  # GET /tabs
  # GET /tabs.json
  def index
    @hours = @venue.hours.all
  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show
  end

  # GET /tabs/new
  def new
    @hour = @venue.hours.build
  end

  # GET /tabs/1/edit
  def edit
    @hours = @venue.hours.all
  end

  def edit_all
#    respond_to do |format|
#      format.html {raise 'bad'}
#      format.js
#    end
  end

  # POST /tabs
  # POST /tabs.json
  def create
    @hour = @venue.hours.build(hour_params)

    respond_to do |format|
      if @hour.save
        format.html { redirect_to [@organisation, @venue, @hour], notice: 'hour was successfully created.' }
        format.json { render :show, status: :created, location: @hour }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :new }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabs/1
  # PATCH/PUT /tabs/1.json
  def update
    respond_to do |format|
      if @hour.update(hour_params)
        format.html { redirect_to [@organisation, @venue, @hour], notice: 'hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @hour }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :edit }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.json
  def destroy
    @hour.destroy
    respond_to do |format|
      format.html { redirect_to organisation_venue_hours_path(@venue), notice: 'hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:organisation_id])
    end

    def set_venue
      @venue = Venue.find(params[:venue_id])
    end

    def set_hour
      @hour = Hour.find(params[:id])
    end

    def set_table
      @table #= Tab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hour_params
      params.require(:hour).permit(:day, :open_time, :close_time, :interval, :covers_per_interval)
    end
end

