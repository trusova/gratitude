class HomeController < ApplicationController
  def index
    if !current_user.nil?
      redirect_to list_path
    end
  end

end
