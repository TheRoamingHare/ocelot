class ActivityLogsController < ApplicationController
  before_action :set_activity_log, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /activity_logs
  # GET /activity_logs.json
  def index
    @activity_logs = ActivityLog.where(User: current_user)
  end

  # POST /activity_logs
  def update_many
    # loop over params
    errors = []
    for i in current_user.NormalWake..(current_user.NormalSleep + 12)
      if (!params["current_activity-" + i.to_s].blank? && !params["current_mood-" + i.to_s].blank?)

        # Update an existing record if there
        if (ActivityLog.where(LogWindow: i).exists?)
          log = ActivityLog.where(LogWindow: i).first
          log.CurrentActivity = params["current_activity-" + i.to_s]
          log.CurrentMood = params["current_mood-" + i.to_s]
        else
          # TODO: Variable date
          log = ActivityLog.new(CurrentActivity: params["current_activity-" + i.to_s],
                  CurrentMood: params["current_mood-" + i.to_s],
                  LogWindow: i,
                  LogDate: Date.current().to_s(:iso8601))
        end

        # Attempt to save the log
        if !log.save
          errors << "Could not update record for #{i}:00, please try again"
        end

      # Is one there but not the other? Let the user know
      elsif (!!params["current_activity-" + i.to_s].blank? ^ !!params["current_mood-" + i.to_s].blank?)
          errors << "Missing some data for #{i}:00, please try again."
      end
    end

    # TODO: Display the errors array
    redirect_to activity_logs_url, notice: 'Logs were updated.'
  end

  # GET /activity_logs/1
  # GET /activity_logs/1.json
  def show
    protect_log_created_by(params[:id])
  end

  # GET /activity_logs/new
  def new
    @activity_log = ActivityLog.new
  end

  # GET /activity_logs/1/edit
  def edit
    protect_log_created_by(params[:id])
  end

  # POST /activity_logs
  # POST /activity_logs.json
  def create
    @activity_log = ActivityLog.new(activity_log_params)
    @activity_log.User = current_user

    respond_to do |format|
      if @activity_log.save
        format.html { redirect_to @activity_log, notice: 'Activity log was successfully created.' }
        format.json { render :show, status: :created, location: @activity_log }
      else
        format.html { render :new }
        format.json { render json: @activity_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_logs/1
  # PATCH/PUT /activity_logs/1.json
  def update
    protect_log_created_by(params[:id])

    respond_to do |format|
      if @activity_log.update(activity_log_params)
        format.html { redirect_to @activity_log, notice: 'Activity log was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_log }
      else
        format.html { render :edit }
        format.json { render json: @activity_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_logs/1
  # DELETE /activity_logs/1.json
  def destroy
    protect_log_created_by(params[:id])

    @activity_log.destroy
    respond_to do |format|
      format.html { redirect_to activity_logs_url, notice: 'Activity log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_log
      @activity_log = ActivityLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_log_params
      if (params[:activity_log])
        params.require(:activity_log).permit(:CurrentActivity, :CurrentMood)
      end
      # TODO: Strong params on many update case
    end
end
