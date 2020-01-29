class PagesController < ApplicationController
  def home
    if current_user
      if current_user.campaigns.all.size > 0
        redirect_to campaigns_path
      end
    end
  end
end
