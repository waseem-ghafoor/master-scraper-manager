class ScriptsController < ApplicationController
  before_action :set_script, only: %i[ show edit update destroy remove_scraper]
  include DownloadFile

  # GET /scripts or /scripts.json
  def index
    @scripts = Script.all
  end

  # GET /scripts/1 or /scripts/1.json
  def show
  end

  # GET /scripts/new
  def new
    @script = Script.new
  end

  # GET /scripts/1/edit
  def edit
  end

  # POST /scripts or /scripts.json
  def create
    @script = Script.new(script_params)
    respond_to do |format|
      if @script.save
        @script.set_script_running_time
        format.html { redirect_to @script, notice: "Script was successfully created." }
        format.json { render :show, status: :created, location: @script }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scripts/1 or /scripts/1.json
  def update
    respond_to do |format|
      script_params['status'] = 'Scheduled'
      if @script.update(script_params)
        @script.set_script_running_time
        format.html { redirect_to @script, notice: "Script was successfully updated." }
        format.json { render :show, status: :ok, location: @script }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scripts/1 or /scripts/1.json
  def destroy
    @script.destroy
    respond_to do |format|
      format.html { redirect_to scripts_url, notice: "Script was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def remove_scraper
    @script.update_attribute("schedule", nil)
    Delayed::Job.where(script_name: @script.name)
  end

  def download_output_file
    script_output_download params[:file_name]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script
      @script = Script.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def script_params
      params.require(:script).permit(:name, :schedule, :status, {input_file: []})
    end
end