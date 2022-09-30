class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    # El usuario se registra con lo usual, por defecto se comporta como Fashion Lover
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    # Si el usuario decide convertirse en Brand, puede editar sus atributos. Se convierte en Referrer
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name role brand description photo])
  end
end
