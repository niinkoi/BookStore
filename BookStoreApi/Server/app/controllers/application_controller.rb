# frozen_string_literal: true

class ApplicationController < ActionController::API

  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_params, if: :devise_controller?

  protected

  def configure_permitted_params
    added_attrs = %i[first_name last_name username password_confirmation session]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :new_user_session, keys: added_attrs
  end
end
