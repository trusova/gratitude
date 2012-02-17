class GratitudesController < ApplicationController
  # GET /gratitudes
  # GET /gratitudes.xml
  def index
    @gratitude = Gratitude.new
    @external_user = User.find_by_cached_slug(params[:name])
    
    if @external_user
    @gratitudes = Gratitude.find(:all, :conditions => ["user_id = ?", @external_user.id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gratitude }
    end
    else
     redirect_to root_path
    end
     
  end

  # GET /gratitudes/1
  # GET /gratitudes/1.xml
  def show
    @gratitude = Gratitude.new
    @gratitudes = Gratitude.find(:all, :conditions => ["share = true"], :order => 'created_at DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gratitude }
    end
  end
  
  def holiday
    @gratitude = Gratitude.new
    @gratitudes = Gratitude.find(:all, :conditions => ["share = true"], :order => 'day DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gratitude }
    end
  end
  
    # GET /gratitudes/1
  # GET /gratitudes/1.xml
  def display
    @gratitude = Gratitude.new
    @gratitudes = Gratitude.find(:all, :conditions => ["share = true"], :order => 'created_at DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gratitude }
    end
  end

  # GET /gratitudes/new
  # GET /gratitudes/new.xml
  def new
    if user_signed_in?

    @gratitude = Gratitude.new
    #@gratitudes = Gratitude.find(:all, :order => 'created_at DESC', :conditions => ["user_id = ?", current_user.id])
    @gratitudes = Gratitude.find(:all, :order => 'day DESC, created_at', :conditions => ["user_id = ?", current_user.id])
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gratitude }
    end
    end
    
  end

  # GET /blessings/1/edit
  def edit
    @gratitude = Gratitude.find(params[:id])
  end

  # POST /gratitudes
  # POST /gratitudes.xml
  def create
    
    #omniauth = request.env['omniauth.auth']
    
    if user_signed_in?
    @gratitude = Gratitude.new(params[:gratitude].merge(:user => current_user))

    respond_to do |format|
      if @gratitude.save
        format.html { redirect_to(new_gratitude_path, :notice => 'Gratitude was successfully created.') }
        format.xml  { render :xml => @gratitude, :status => :created, :location => @gratitude }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gratitude.errors, :status => :unprocessable_entity }
      end
    end
    else
     redirect_to root_path
    end
    
    
  end

  # PUT /gratitudes/1
  # PUT /gratitudes/1.xml
  def update
    @gratitude = Gratitude.find(params[:id])

    respond_to do |format|
      if @gratitude.update_attributes(params[:gratitude])
        format.html { redirect_to(@gratitude, :notice => 'Gratitude was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gratitude.errors, :status => :unprocessable_entity }
      end
    end
  end

def share
    @gratitudes = Gratitude.find(:all, :conditions => ["user_id = ? and day = ?", current_user.id, params[:day]])
 if @gratitudes 
  @gratitudes.each do |blessing|
      if blessing.share
          blessing.update_attributes(:share => false)
      else
          blessing.update_attributes(:share => true)
      end
    
    end
 end
 redirect_to("/community")
 end

  # DELETE /gratitudes/1
  # DELETE /gratitudes/1.xml
  def destroy
    @gratitude = Gratitude.find(params[:id])
    @gratitude.destroy

    respond_to do |format|
      format.html { redirect_to(gratitudes_url) }
      format.xml  { head :ok }
    end
  end
end
