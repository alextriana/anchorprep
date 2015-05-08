class UsersController < ApplicationController
  before_action :set_update, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, :except => [:create]

  # GET /user
  # GET /user.json
  def index
    @user = User.all
  end

  # GET /user/1
  # GET /user/1.json
  def show
  end

  # GET /user/new
  def new
    @user = User.new
  end

  # GET /user/1/edit
  def edit
  end

  # POST /user
  # POST /user.json
  def create
    if User.exists?(email: params[:email])
      flash[:warning] = "The email #{params[:email]} has already been added to our email list."
    else
      update_params = params.permit(:email, :first_name, :last_name, :relationship, :graduation)
      @user = User.new(update_params).save
      flash[:success] = "Your email #{params[:email]} has been added to our email list!"
    end
    redirect_to root_url
  end

  # PATCH/PUT /user/1
  # PATCH/PUT /user/1.json
  def update
    respond_to do |format|
      if @user.update(update_params)
        format.html { redirect_to @user, notice: 'Update was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/1
  # DELETE /user/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: 'Update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end
end
