class NofiticationsController < ApplicationController
  before_action :set_nofitication, only: %i[ show edit update destroy ]

  # GET /nofitications or /nofitications.json
  def index
    @nofitications = Nofitication.all
  end

  # GET /nofitications/1 or /nofitications/1.json
  def show
  end

  # GET /nofitications/new
  def new
    @nofitication = Nofitication.new
  end

  # GET /nofitications/1/edit
  def edit
  end

  # POST /nofitications or /nofitications.json
  def create
    @nofitication = Nofitication.new(nofitication_params)

    respond_to do |format|
      if @nofitication.save
        format.html { redirect_to nofitication_url(@nofitication), notice: "Nofitication was successfully created." }
        format.json { render :show, status: :created, location: @nofitication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nofitication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nofitications/1 or /nofitications/1.json
  def update
    respond_to do |format|
      if @nofitication.update(nofitication_params)
        format.html { redirect_to nofitication_url(@nofitication), notice: "Nofitication was successfully updated." }
        format.json { render :show, status: :ok, location: @nofitication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nofitication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nofitications/1 or /nofitications/1.json
  def destroy
    @nofitication.destroy!

    respond_to do |format|
      format.html { redirect_to nofitications_url, notice: "Nofitication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nofitication
      @nofitication = Nofitication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nofitication_params
      params.require(:nofitication).permit(:title, :description, :type, :send_status, :send_at, :user_id)
    end
end
