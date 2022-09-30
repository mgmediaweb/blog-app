# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with(resource) do |format|
      format.html { redirect_to after_sign_in_path_for(resource) }
      format.json { render json: { message: 'Logged in.' }, status: :ok }
    end
  end

  private

  def respond_to_on_destroy
    respond_to do |format|
      format.html { redirect_to after_sign_out_path_for(resource_name) }
      format.json { current_user ? log_out_failure : log_out_success }
    end
  end

end
