class BuzzsController < ApplicationController
  before_action :set_buzz, only: [:show, :edit, :update, :destroy]

  
  def index
    @buzzs = Buzz.all.order("created_at DESC")
  end

  def show
  end

  def new
    @buzz = Buzz.new
  end

  def edit
  end

  def create
    @buzz = Buzz.new(buzz_params)

    respond_to do |format|
      if @buzz.save
        format.html { redirect_to @buzz, notice: 'Buzz was successfully created.' }
        format.json { render :show, status: :created, location: @buzz }
      else
        format.html { render :new }
        format.json { render json: @buzz.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @buzz.update(buzz_params)
        format.html { redirect_to @buzz, notice: 'Buzz was successfully updated.' }
        format.json { render :show, status: :ok, location: @buzz }
      else
        format.html { render :edit }
        format.json { render json: @buzz.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @buzz.destroy
    respond_to do |format|
      format.html { redirect_to buzzs_url, notice: 'Buzz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_buzz
      @buzz = Buzz.find(params[:id])
    end

    def buzz_params
      params.require(:buzz).permit(:name, :content)
    end
end
