class GratitudeListsController < ApplicationController
  
  def show
    @gratitude_list = GratitudeList.find_by_id(params[:id])
    
    if @gratitude_list.nil?
      @gratitude_list = GratitudeList.latest_list_for_user(current_user)
    end
    
    @current_day = @gratitude_list.current_day
    @gratitude = Gratitude.new(:day => @current_day)
    
    render :show
  end
  
  def list
    @gratitude_list = GratitudeList.latest_list_for_user(current_user)
    current_day = @gratitude_list.current_day
    @gratitude = Gratitude.gratitude(current_day)
    
    render :list
  end
  
end
