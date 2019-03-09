class SubscribersController < ApplicationController
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized


  # GET /subscribers
  # GET /subscribers.json
  def index
    @subscribers = Subscriber.all
    authorize @subscribers
  end

  # GET /subscribers/1
  # GET /subscribers/1.json
  def show
  end

  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
    authorize @subscriber
  end

  # GET /subscribers/1/edit
  def edit
  end

  # POST /subscribers
  # POST /subscribers.json
  def create
    @subscriber = Subscriber.new(subscriber_params)
    @subscriber.user_id = current_user.id
    
    
    @user = User.where(id: current_user.id).first
    @subscriber_substype = @subscriber.substype

    if @subscriber_substype === 3
      if @user.user_role != 'admin'
        @user.user_role = 'other'
        @user.save
      end
    elsif @subscriber_substype === 1
      @user.user_role = 'student'
      @user.save
    elsif @subscriber_substype === 2
      @user.user_role = 'instructor'
      @user.save
    end 

    authorize @subscriber
     
    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @subscriber }
      else
        format.html { render :new }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end

    
  end

  # PATCH/PUT /subscribers/1
  # PATCH/PUT /subscribers/1.json
  def update
    respond_to do |format|
      if @subscriber.update(subscriber_params)
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriber }
      else
        format.html { render :edit }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end

    authorize @subscriber
  end

  # DELETE /subscribers/1
  # DELETE /subscribers/1.json
  def destroy
    @subscriber.destroy
    respond_to do |format|
      format.html { redirect_to subscribers_url, notice: 'Subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end

    authorize @subscriber
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])

      authorize @subscriber
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(:fname, :lname, :citizenid, :substype, :insorstid, :dept)
    end
end
