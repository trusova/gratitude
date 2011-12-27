class SessionsController < ApplicationController
  def new
  end

  def create
  
  auth_hash = request.env['omniauth.auth']
  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  if @authorization
    sign_in_and_redirect(:user, @authorization.user)

    #render :text => "Welcome back #{@authorization.user.email}! You have already signed up."
  else
   # user = User.new :email => auth_hash["user_info"]["email"]
    user = User.new(:name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"], :password => SecureRandom.hex(10), :cached_slug => auth_hash["user_info"]["username"])
    user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    user.save
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])

    #render :text => "Hi #{auth_hash["user_info"]["name"]}! You've signed up."
    #render :text => auth_hash.inspect

    #sign_in_and_redirect(:user, @authorization.user)
    
    return
  end
  end

  def failure
  redirect_to root_path
  end

  def destroy
  session[:user_id] = nil
  redirect_to root_path
end

end
