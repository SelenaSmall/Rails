class SectionsController < ApplicationController
  before_action :set_venue, only: [:show]
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /tabs
  # GET /tabs.json
  def index
    @venue = Venue.friendly.find params[:slug]
    @sections = @venue.sections.all
  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show
  end

  # GET /tabs/new
  def new
    @section = @venue.sections.build
  end

  # GET /tabs/1/edit
  def edit
  #  @sections = @venue.sections.all
  end

  def edit_all
    @section = @venue.sections.build
#    respond_to do |format|
#      format.html {raise 'bad'}
#      format.js
#    end
  end

  # POST /tabs
  # POST /tabs.json
  def create
    @section = @venue.sections.build(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to [@organisation, @venue, @section], notice: 'section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabs/1
  # PATCH/PUT /tabs/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to [@organisation, @venue, @section], notice: 'section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to organisation_venue_sections_path(@venue), notice: 'section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_venue
      @venue = Venue.friendly.find(params[:venue_id])
    end

    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:section, :first_num, :last_num, :bookable)
    end
end

