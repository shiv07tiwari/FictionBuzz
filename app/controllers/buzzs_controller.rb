class BuzzsController < ApplicationController

  # Before Action to get the User in defined actions
  before_action :set_user, only: [:index, :create, :destroy]

  skip_before_action :verify_authenticity_token
  
  def index
    # Redirect to Login if not logged in.
    if !current_user
      redirect_to login_url
    else
      @feed_test = {}
      current_user.followeds.each do |user|
      user.buzzs.each do |user_buzz|
          @feed_test[user_buzz] = user
        end
      end
    
      @feed_buzz = {}
      @buzz_keys = @feed_test.keys.sort_by(&:created_at).reverse
      @buzz_keys.each do |key|
        @feed_buzz[key] = @feed_test[key]
      end
    end
    
  end

  def new
    @buzz = Buzz.new
  end

  def create
    @buzz = @user.buzzs.create(buzz_params)
    respond_to do |format|
      if @buzz.save
        format.html { redirect_to feed_url, notice: 'Buzz was successfully created.' }
        format.json { render :show, status: :created, location: @buzz }
      else
        format.html { render :new }
        format.json { render json: @buzz.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @buzz = @user.buzzs.find(params[:id])
    @buzz.destroy
    respond_to do |format|
      format.html { redirect_to feed_url, notice: 'Buzz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = current_user
    end

    def buzz_params
      params.require(:buzz).permit(:content)
    end
end
