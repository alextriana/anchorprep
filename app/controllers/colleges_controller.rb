class CollegesController < ApplicationController
  before_action :set_college, only: [ :show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, :except => [:index, :show]


  # GET /colleges
  # GET /colleges.json
  def index
    @colleges = College.all
  end

  # GET /colleges/1
  # GET /colleges/1.json
  def show
    @colleges = College.all
    @college = College.find(params[:id])
  end

  # GET /colleges/new
  def new
    @college = College.new
  end

  # GET /colleges/1/edit
  def edit
  end

  # POST /colleges
  # POST /colleges.json
  def create
    @college = College.new(college_params)

    @college.facts = params.require(:college)[:facts].split("\r\n")
    @college.basics = params.require(:college)[:basics].split("\r\n")
    respond_to do |format|
      if @college.save
        format.html { redirect_to @college, notice: 'College was successfully created.' }
        format.json { render :show, status: :created, location: @college }
      else
        format.html { render :new }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colleges/1
  # PATCH/PUT /colleges/1.json
  def update
    @college.facts = params.require(:college)[:facts].split("\r\n")
    @college.basics = params.require(:college)[:basics].split("\r\n")
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to @college, notice: 'College was successfully updated.' }
        format.json { render :show, status: :ok, location: @college }
      else
        format.html { render :edit }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colleges/1
  # DELETE /colleges/1.json
  def destroy
    @college.destroy
    respond_to do |format|
      format.html { redirect_to admin_index, notice: 'College was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = College.find(params[:id])
      if @college.facts != nil
        @college.facts = @college.facts.join("\r\n")
      end
      if @college.basics
        @college.basics = @college.basics.join("\r\n")
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def college_params
      params.require(:college).permit(:name, :other, :website, :early_action, :early_decision, :regular_decision, :quote, :quote_author)
    end
end
