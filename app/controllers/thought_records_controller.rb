class ThoughtRecordsController < ApplicationController
  before_action :set_thought_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /thought_records
  # GET /thought_records.json
  def index
    @thought_records = ThoughtRecord.all
  end

  # GET /thought_records/1
  # GET /thought_records/1.json
  def show
  end

  # GET /thought_records/new
  def new
    @thought_record = ThoughtRecord.new
  end

  # GET /thought_records/1/edit
  def edit
  end

  # POST /thought_records
  # POST /thought_records.json
  def create
    @thought_record = ThoughtRecord.new(thought_record_params)

    respond_to do |format|
      if @thought_record.save
        format.html { redirect_to @thought_record, notice: 'Thought record was successfully created.' }
        format.json { render :show, status: :created, location: @thought_record }
      else
        format.html { render :new }
        format.json { render json: @thought_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thought_records/1
  # PATCH/PUT /thought_records/1.json
  def update
    respond_to do |format|
      if @thought_record.update(thought_record_params)
        format.html { redirect_to @thought_record, notice: 'Thought record was successfully updated.' }
        format.json { render :show, status: :ok, location: @thought_record }
      else
        format.html { render :edit }
        format.json { render json: @thought_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thought_records/1
  # DELETE /thought_records/1.json
  def destroy
    @thought_record.destroy
    respond_to do |format|
      format.html { redirect_to thought_records_url, notice: 'Thought record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thought_record
      @thought_record = ThoughtRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thought_record_params
      params.require(:thought_record).permit(:CurrentSituation, :Emotions, :FirstEmotionStrength, :AutoThoughts, :AltResponse, :SecondEmotionStrength)
    end
end
