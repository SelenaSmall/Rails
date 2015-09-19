class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]

  def index
    @organisations = Organisation.all
  end

  def bookings
    @organisations = Organisation.all
  end

  def show
  end

  def new
    @organisation = Organisation.new
  end

  def edit
  end

  def create
    @organisation = Organisation.new(organisation_params)

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: 'organisation was successfully created.' }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to @organisation, notice: 'organisation was successfully updated.' }
        format.json { render :show, status: :ok, location: @organisation }
#        format.js {redirect_via_turbolinks_to [@organisation]}
      else
        format.html { render :edit }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organisation.destroy
    respond_to do |format|
      format.html { redirect_to organisation_url, notice: 'organisation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organisation
      @organisation = Organisation.friendly.find(params[:id])
    end

    def organisation_params
      params.require(:organisation).permit(:name, :phone, :address, :email, :number_of_tabs)
    end
end