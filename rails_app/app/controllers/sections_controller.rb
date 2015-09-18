class SectionsController < VenueLayoutController
  before_action :set_venue
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  def index
    @sections = @venue.sections.all
  end

  def new
    @section = @venue.sections.build
  end

  def edit
  end

  def edit_all
    @section = @venue.sections.build
#    respond_to do |format|
#      format.html {raise 'bad'}
#      format.js
#    end
  end

  def create
    @section = @venue.sections.build(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to [@venue, @sections], notice: 'section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to [@venue, @sections], notice: 'section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to venue_path(@venue), notice: 'section was successfully destroyed.' }
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

    def section_params
      params.require(:section).permit(:section, :first_num, :last_num, :bookable)
    end
end