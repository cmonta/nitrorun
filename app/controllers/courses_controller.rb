class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @nbre = Course.find_by_id(params[:id]).coureurs.count
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    
  # GET /vendors/1/register?clientid=1
  # Register a client to a vendor
  def register

    @course = Course.find(params[:id])
    @coureur = Coureur.find(params[:userid])

    # Register a client if it is not registered already
    unless @course.registered?(@coureur)
      # Add vendor to a client's vendor list
      @coureur.courses << @course
      flash[:notice] = 'User register with the course successfully'
    else
      flash[:error] = 'User already registered'
    end
    # Redirect to the action "clients"
    # Redirect to /vendors/1/clients for vendor id 1
    redirect_to :action => :coureurs, :id => @course
  end

  # Display all clients of a vendor
  # GET /vendors/1/clients
  def coureurs
    @coureurs = Course.find(params[:id]).coureurs
    @name = Course.find(params[:id]).nom
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:nom, :distance, :ville, :date, :description, :url)
    end
end
