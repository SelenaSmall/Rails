class VenuesController < VenueLayoutController
  before_action :set_organisation, only: [:create, :new, :index]
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_action :set_grid
  before_action :set_plan
  before_action :set_runsheet

  def index
    @venues = @organisation.venues
  end

  def bookings
  end

  def show
  end

  def opening_hours
  end

  def notes
  end

  def customers
    @venue = Venue.friendly.find params[:id]
    @customers = @venue.customers.all
  end

  def new
    @venue = @organisation.venues.build
  end

  def edit
  end

  def create
    @venue = @organisation.venues.build(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @organisation, notice: 'venue was successfully created.' }
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

    def set_grid
      @grid 
    end

    def set_plan
      @plan
    end

    def set_runsheet
      @runsheet
    end
end