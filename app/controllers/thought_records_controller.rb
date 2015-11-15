class ThoughtRecordsController < ApplicationController
  before_action :set_thought_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /thought_records
  # GET /thought_records.json
  # GET /activity_logs/:activity_log_id/thought_records
  # GET /activity_logs/:activity_log_id/thought_records.json
  def index
    # Render all if not viewed in the context of a activity log.
    if !params[:activity_log_id]
      @thought_records = []
      ActivityLog.where(User: current_user).each do |log|
        @thought_records << log.ThoughtRecord if log.ThoughtRecord
      end

    # Otherwise, render just associated with activity log
    else
      protect_log_created_by(params[:activity_log_id])
      @thought_records = ThoughtRecord.where(ActivityLog: params[:activity_log_id])
      @log = params[:activity_log_id]
    end
  end

  # GET /activity_logs/:activity_log_id/thought_records/1
  # GET /activity_logs/:activity_log_id/thought_records/1.json
  def show
    protect_log_created_by(params[:activity_log_id])
    protect_thought_created_by(params[:id])
  end

  # GET /activity_logs/:activity_log_id/thought_records/new
  def new
    @thought_record = ThoughtRecord.new
    @thought_record.ActivityLog = ActivityLog.find(params[:activity_log_id])
  end

  # GET /activity_logs/:activity_log_id/thought_records/1/edit
  def edit
    protect_log_created_by(params[:activity_log_id])
    protect_thought_created_by(params[:id])
  end

  # POST /activity_logs/:activity_log_id/thought_records
  # POST /activity_logs/:activity_log_id/thought_records.json
  def create
    @thought_record = ThoughtRecord.new(thought_record_params)
    @thought_record.ActivityLog = ActivityLog.find(params[:activity_log_id])
    # TODO: Make sure create only as part of activity log

    respond_to do |format|
      if @thought_record.save
        format.html { redirect_to [@thought_record.ActivityLog, @thought_record], notice: 'Thought record was successfully created.' }
        format.json { render :show, status: :created, location: @thought_record }
      else
        format.html { render :new }
        format.json { render json: @thought_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_logs/:activity_log_id/thought_records/1
  # PATCH/PUT /activity_logs/:activity_log_id/thought_records/1.json
  def update
    protect_log_created_by(params[:activity_log_id])
    protect_thought_created_by(params[:id])

    respond_to do |format|
      if @thought_record.update(thought_record_params)
        format.html { redirect_to [@thought_record.ActivityLog, @thought_record], notice: 'Thought record was successfully updated.' }
        format.json { render :show, status: :ok, location: @thought_record }
      else
        format.html { render :edit }
        format.json { render json: @thought_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_logs/:activity_log_id/thought_records/1
  # DELETE /activity_logs/:activity_log_id/thought_records/1.json
  def destroy
    protect_log_created_by(params[:activity_log_id])
    protect_thought_created_by(params[:id])

    log = @thought_record.ActivityLog

    @thought_record.destroy
    respond_to do |format|
      format.html { redirect_to activity_log_thought_records_url(log), notice: 'Thought record was successfully destroyed.' }
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
