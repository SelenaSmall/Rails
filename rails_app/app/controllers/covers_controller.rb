class CoversController < ApplicationController
  before_action :set_venue, only: [:show, :create]
  before_action :set_cover, only: [:show, :edit, :update, :destroy]

  def index
    @venue = Venue.friendly.find params[:slug]
    @covers = @venue.covers.all
  end

  def show
  end

  def new
    @venue = Venue.friendly.find params[:slug]
    @cover = @venue.covers.build
  end

  def edit
  #  @covers = @venue.covers.all
  end

 def edit_all
  @cover = @venue.covers.build
#    respond_to do |format|
#     format.html {raise 'bad'}
#      format.js
#    end
  end

  def create
    @cover = @venue.covers.build(cover_params)

    respond_to do |format|
      if @cover.save
        format.html { redirect_to [@organisation, @venue, @cover], notice: 'cover was successfully created.' }
        format.json { render :show, status: :created, location: @cover }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :new }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cover.update(cover_params)
        format.html { redirect_to [@organisation, @venue, @cover], notice: 'cover was successfully updated.' }
        format.json { render :show, status: :ok, location: @cover }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :edit }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cover.destroy
    respond_to do |format|
      format.html { redirect_to organisation_venue_covers_path(@venue), notice: 'cover was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_venue
      @venue = Venue.friendly.find(params[:venue_id])
    end

    def set_cover
      @cover = Cover.find(params[:id])
    end

    def cover_params
      params.require(:cover).permit(:covers, :covers_group, :turn_time)
    end
end

