class VenuesController < ApplicationController
  before_action :set_user
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /tabs
  # GET /tabs.json
  def index
#    @venues = Venue.all
    @venues = @user.venues.all
  end

  def bookings
    @venues = Venue.all
  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show
  end

  # GET /tabs/new
  def new
#    @venue = Venue.new
    @venue = @user.venues.build
  end

  # GET /tabs/1/edit
  def edit
  end

  # POST /tabs
  # POST /tabs.json
  def create
#    @venue = venue.new(venue_params)
    @venue = @user.venues.build(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to [@user, @venue], notice: 'venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabs/1
  # PATCH/PUT /tabs/1.json
  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to [@user, @venue], notice: 'venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue }
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
      format.html { redirect_to user_venues_path(@user), notice: 'venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:name, :phone, :email, :address)
    end
end


