class BuildingsController < ApplicationController
  before_action :set_building, only: %i[ show edit update destroy ]
  before_action :consultar_features, only: %i[ show new edit create update ]
  before_action :authenticate_user!
  before_action :soy_usuario, except: %i[ index show ]
  before_action :soy_conserje?, except: %i[ index show new edit create update ]
  before_action :soy_admin?, except: %i[ index show new edit create update destroy]


  # GET /buildings or /buildings.json
  def index
    @q = Building.ransack(params[:q])
    @pagy, @buildings = pagy(@q.result)
    # @buildings = Building.all
    @total_edificios = Building.total_edificios
  end

  # GET /buildings/1 or /buildings/1.json
  def show
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings or /buildings.json
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: "Building was successfully created." }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1 or /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: "Building was successfully updated." }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1 or /buildings/1.json
  def destroy
    @building.destroy!

    respond_to do |format|
      format.html { redirect_to buildings_path, status: :see_other, notice: "Building was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def building_params
      params.require(:building).permit(:nombre, :direccion, feature_ids: [])
    end

    def consultar_features
      @features = Feature.all
    end
end
