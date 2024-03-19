class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :email, :password, :password_confirmation, :bio, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :email, :password, :password_confirmation, :bio, :photo, :current_password])
  end

  def update_last_seen_at
    current_user.update(last_seen_at: Time.now, status: true)
    ActionCable.server.broadcast(
      "user_status_stream", {
        user_id: current_user.id,
        last_seen_at: current_user.last_seen_at,
        status: current_user.status
      }
    )
  end
end
