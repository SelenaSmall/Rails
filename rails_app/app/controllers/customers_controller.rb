class CustomersController < VenueLayoutController
  before_action :set_venue
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = @venue.customers.all
  end

  def show
  end

  def new
    @customer = @venue.customers.build
  end

  def edit
  end

  def create
    @customer = @venue.customers.build(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to [@venue, @customers], notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to [@venue, @customers], notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to venue_customers_path(@venue), notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_venue
      @venue = Venue.friendly.find(params[:venue_id])
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :phone, :email)
    end
end
