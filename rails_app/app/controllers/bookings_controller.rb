class BookingsController < VenueLayoutController
  before_action :set_venue
  before_action :set_tables
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = @venue.bookings.all
  end

  def show
  end

  def new
    @booking = @venue.bookings.build
  end

  def edit
  end

  def create
    @booking = @venue.bookings.build(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to runsheet_path(@venue), notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
#       format.js {redirect_via_turbolinks_to [@venue]}
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to runsheet_path(@venue), notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
#       format.js {redirect_via_turbolinks_to [@venue]}
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to runsheet_path(@venue), notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_venue
      @venue = Venue.friendly.find(params[:venue_id])
    end
    def set_tables
      @tables
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:name, :phone, :email, :start_time, :tab_name)
    end
end

