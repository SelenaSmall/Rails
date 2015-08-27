class UsersController < VenueLayoutController
  before_action :set_organisation
  before_action :set_venue
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /tabs
  # GET /tabs.json
  def index
    @users = @organisation.users.all
  end

#  def search
#    if @user.search(user_params)
#      @users = user.search(params[:search]).order("created_at DESC")
#    else
#      @users = user.order("created_at DESC")
#    end
#  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show
  end

  # GET /tabs/new
  def new
    @user = @organisation.users.build
  end

  # GET /tabs/1/edit
  def edit
  end

  # POST /tabs
  # POST /tabs.json
  def create
    @user = @organisation.users.build(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to [@organisation, @user], notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabs/1
  # PATCH/PUT /tabs/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [@organisation, @user], notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to organisation_organisation_users_path(@organisation), notice: 'user was successfully destroyed.' }
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

    def set_user
      @user = User.find(params[:id])
    end

#    def search_user
#      @user = user.search(params[:search])
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :password, :first_name, :last_name, :email, :phone, :facebook)
    end
end
