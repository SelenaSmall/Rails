class NotesController < ApplicationController
  before_action :set_organisation
  before_action :set_venue
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /tabs
  # GET /tabs.json
  def index
    @notes = @venue.notes.all
  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show
  end

  # GET /tabs/new
  def new
    @note = @venue.notes.build
  end

  # GET /tabs/1/edit
  def edit
  #  @notes = @venue.notes.all
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
    @note = @venue.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to [@organisation, @venue, @note], notice: 'note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabs/1
  # PATCH/PUT /tabs/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to [@organisation, @venue, @note], notice: 'note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to organisation_venue_notes_path(@venue), notice: 'note was successfully destroyed.' }
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

    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit()
    end
end

