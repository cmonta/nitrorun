class CoureursController < ApplicationController
  before_action :set_coureur, only: [:show, :edit, :update, :destroy]

  # GET /coureurs
  # GET /coureurs.json
  def index
    @coureurs = Coureur.all
  end

  # GET /coureurs/1
  # GET /coureurs/1.json
  def show
  end

  # GET /coureurs/new
  def new
    @coureur = Coureur.new
  end

  # GET /coureurs/1/edit
  def edit
  end

  # POST /coureurs
  # POST /coureurs.json
  def create
    @coureur = Coureur.new(coureur_params)

    respond_to do |format|
      if @coureur.save
        format.html { redirect_to @coureur, notice: 'Coureur was successfully created.' }
        format.json { render :show, status: :created, location: @coureur }
      else
        format.html { render :new }
        format.json { render json: @coureur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coureurs/1
  # PATCH/PUT /coureurs/1.json
  def update
    respond_to do |format|
      if @coureur.update(coureur_params)
        format.html { redirect_to @coureur, notice: 'Coureur was successfully updated.' }
        format.json { render :show, status: :ok, location: @coureur }
      else
        format.html { render :edit }
        format.json { render json: @coureur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coureurs/1
  # DELETE /coureurs/1.json
  def destroy
    @coureur.destroy
    respond_to do |format|
      format.html { redirect_to coureurs_url, notice: 'Coureur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coureur
      @coureur = Coureur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coureur_params
      params.require(:coureur).permit(:pseudo, :ville, :user_id)
    end
end
