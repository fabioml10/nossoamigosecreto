class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #redireciona quando 404
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    #redireciona para home (pode colocar para uma 404 específica '/404.html')
    redirect_to main_app.root_url
  end

end
