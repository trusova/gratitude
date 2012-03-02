class CommunityController < ApplicationController
  
  def index
    @days = Day.find(:all, :conditions => ["is_public = true"], :order => 'created_at DESC')  
  end
  
end
