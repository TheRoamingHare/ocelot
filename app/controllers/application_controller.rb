class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :Name << :Zip << :Age << :NormalWake << :NormalSleep
  end

  # Make sure only the proper user can affect the model
  def protect_log_created_by(id)
    log = ActivityLog.find(id)

    if log.User != current_user
      # TODO: Make this render a helpful error message
      render(status: :forbidden, text: "Access denied.")
      return false
    end

    return true
  end

  # Make sure only the proper user can affect the model
  def protect_thought_created_by(id)
    record = ThoughtRecord.find(id)

    if record.ActivityLog.User != current_user
      # TODO: Make this render a helpful error message
      render(status: :forbidden, text: "Access denied.")
      return false
    end

    return true
  end

end
