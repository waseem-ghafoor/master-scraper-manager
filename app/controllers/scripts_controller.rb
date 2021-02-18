class ScriptsController < ApplicationController
  before_action :set_script, only: %i[ show edit update destroy ]
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
    
    date_and_time = '%d-%m-%Y %H:%M:%S %Z'
    date_time = DateTime.strptime("#{script_params["schedule(3i)"]}-#{script_params["schedule(2i)"]}-#{script_params["schedule(1i)"]} #{script_params["schedule(4i)"]}:#{script_params["schedule(5i)"]}:00 Central Time (US & Canada)",date_and_time)
    @script = Script.new(name: script_params['name'], schedule: date_time , status: 'Not Set')
    #@script = Script.new(script_params)
    #date_time.in_time_zone("Karachi")
    byebug
    respond_to do |format|
      if @script.save
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
      if @script.update(script_params)
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
      params.require(:script).permit(:name, :schedule, {input_file: []})
    end
end
