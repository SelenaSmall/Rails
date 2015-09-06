class TablesController < VenueLayoutController
  before_action :set_venue, except: [:grid, :plan]
  before_action :set_table, only: [:show, :edit, :update, :destroy]

  # GET /tabs
  # GET /tabs.json
  def index
    @tables = @venue.tables.all

#    if params[:type] == 'summary'
#      render 'summary'
#    else 

      render 'grid'
#    end
  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show
  end

  def grid
    @venue = Venue.friendly.find params[:slug]
    @tables = @venue.tables.all
  end

  def plan
    @venue = Venue.friendly.find params[:slug]
    @tables = @venue.tables.all
  end
  # GET /tabs/new
  def new
    @table = @venue.tables.build
  end

  # GET /tabs/1/edit
  def edit
    @tables = @venue.tables.all
  end

  def edit_all
      @table = @venue.tables.build
#    respond_to do |format|
#      format.html {raise 'bad'}
#      format.js
#    end
  end

  # POST /tabs
  # POST /tabs.json
  def create
    @table = @venue.tables.build(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to [@organisation, @venue, @table], notice: 'table was successfully created.' }
        format.json { render :show, status: :created, location: @table }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabs/1
  # PATCH/PUT /tabs/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to [@organisation, @venue, @table], notice: 'table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
        format.js {redirect_via_turbolinks_to [@venue.organisation, @venue]}
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to organisation_venue_tables_path(@venue), notice: 'table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_venue
      @venue = Venue.find(params[:venue_id])
    end

    def set_table
      @table = Table.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:tab, :section, :min_covers, :max_covers, :booking_order)
    end
end

