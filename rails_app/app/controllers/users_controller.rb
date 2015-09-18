class UsersController < VenueLayoutController
  before_action :set_venue
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = @venue.users.all
  end

  def show
  end

  def new
    @user = @venue.users.build
  end

  def edit
  end

  def create
    @user = @venue.users.build(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to [@venue, @users], notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to organisation_organisation_users_path(@organisation), notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_venue
      @venue = Venue.friendly.find(params[:venue_id])
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:user_name, :password, :first_name, :last_name, :email, :phone, :facebook)
    end
end