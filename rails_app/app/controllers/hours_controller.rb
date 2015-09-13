class HoursController < VenueLayoutController
  before_action :set_venue
  before_action :set_hour, only: [:show, :edit, :update, :destroy]

  def index
    @hours = @venue.hours.all
  end

  def new
    @hour = @venue.hours.build
  end

  def edit
  end

  def edit_all
    @hour = @venue.hours.build
#    respond_to do |format|
#      format.html {raise 'bad'}
#      format.js
#    end
  end

  def create
    @hour = @venue.hours.build(hour_params)

    respond_to do |format|
      if @hour.save
        format.html { redirect_to [@venue, @hours], notice: 'hour was successfully created.' }
        format.json { render :show, status: :created, location: @hour }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :new }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hour.update(hour_params)
        format.html { redirect_to [@venue, @hours], notice: 'hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @hour }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :edit }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hour.destroy
    respond_to do |format|
      format.html { redirect_to venue_path(@venue), notice: 'hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_venue
      @venue = Venue.friendly.find(params[:venue_id])
    end

    def set_hour
      @hour = Hour.find(params[:id])
    end

    def set_table
      @table #= Tab.find(params[:id])
    end

    def hour_params
      params.require(:hour).permit(:day, :open_time, :close_time, :interval, :covers_per_interval)
    end
end

