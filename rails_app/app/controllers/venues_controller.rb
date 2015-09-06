class VenuesController < VenueLayoutController
  before_action :set_organisation, only: [:create, :new]
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_action :set_hour
  before_action :set_cover
  before_action :set_section 
  before_action :set_note
  before_action :set_grid
  before_action :set_plan

  def index
  #  @organisation = Organisation.friendly.find params[:slug]
    @venues = Venue.all
  end

  def bookings
  end

  def show
  end

  def opening_hours
  end

  def covers
    @venue = Venue.friendly.find params[:slug]
    @covers = @venue.covers.all
  end

  def notes
  end

  def customers
    @venue = Venue.friendly.find params[:slug]
    @customers = @venue.customers.all
  end

  def new
#    @organisation = Organisation.friendly.find params[:slug]
    @venue = @organisation.venues.new
  end

  def edit
  end

  def create
    @venue = @organisation.venues.build(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to [@organisation, @venue], notice: 'venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
        format.js { render partial: 'shared/ajax_form_errors', locals: {model: @venue}, status: 400}
      end
    end
  end

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

  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to organisation_venues_path(@organisation), notice: 'venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organisation
      @organisation = Organisation.friendly.find(params[:organisation_id])
    end

    def set_venue
      @venue = Venue.friendly.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :phone, :email, :address)
    end

    def set_hour
      @hour 
    end

    def set_cover
      @cover 
    end

        def set_section
      @section 
    end

    def set_note
      @note 
    end

    def set_grid
      @grid 
    end

    def set_plan
      @plan
    end

end


