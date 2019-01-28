class MinigamesController < ApplicationController
  before_action :set_minigame, only: [:show, :edit, :update, :destroy]

  # GET /minigames
  # GET /minigames.json
  def index
    @minigames = Minigame.all
  end

  # GET /minigames/1
  # GET /minigames/1.json
  def show
  end

  # GET /minigames/new
  def new
    @minigame = Minigame.new
  end

  # GET /minigames/1/edit
  def edit
  end

  # POST /minigames
  # POST /minigames.json
  def create
    @minigame = Minigame.new(minigame_params)

    respond_to do |format|
      if @minigame.save
        format.html { redirect_to @minigame, notice: 'Minigame was successfully created.' }
        format.json { render :show, status: :created, location: @minigame }
      else
        format.html { render :new }
        format.json { render json: @minigame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minigames/1
  # PATCH/PUT /minigames/1.json
  def update
    respond_to do |format|
      if @minigame.update(minigame_params)
        format.html { redirect_to @minigame, notice: 'Minigame was successfully updated.' }
        format.json { render :show, status: :ok, location: @minigame }
      else
        format.html { render :edit }
        format.json { render json: @minigame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minigames/1
  # DELETE /minigames/1.json
  def destroy
    @minigame.destroy
    respond_to do |format|
      format.html { redirect_to minigames_url, notice: 'Minigame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minigame
      @minigame = Minigame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def minigame_params
      params.require(:minigame).permit(:game_id, :content)
    end
end
