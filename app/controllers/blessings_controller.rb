class BlessingsController < ApplicationController
  # GET /blessings
  # GET /blessings.xml
  def index
    @blessings = Blessing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blessings }
    end
  end

  # GET /blessings/1
  # GET /blessings/1.xml
  def show
    @blessing = Blessing.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blessing }
    end
  end

  # GET /blessings/new
  # GET /blessings/new.xml
  def new
    if user_signed_in?
    @blessing = Blessing.new
    @blessings = Blessing.find(:all, :conditions => ["user_id = ?", current_user.id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blessing }
    end
    end
    
  end

  # GET /blessings/1/edit
  def edit
    @blessing = Blessing.find(params[:id])
  end

  # POST /blessings
  # POST /blessings.xml
  def create
    
    #omniauth = request.env['omniauth.auth']
    
    if user_signed_in?
    @blessing = Blessing.new(params[:blessing].merge(:user => current_user))

    respond_to do |format|
      if @blessing.save
        format.html { redirect_to(new_blessing_path, :notice => 'Gratitude was successfully created.') }
        format.xml  { render :xml => @blessing, :status => :created, :location => @blessing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blessing.errors, :status => :unprocessable_entity }
      end
    end
    else
     redirect_to root_path
    end
    
    
  end

  # PUT /blessings/1
  # PUT /blessings/1.xml
  def update
    @blessing = Blessing.find(params[:id])

    respond_to do |format|
      if @blessing.update_attributes(params[:blessing])
        format.html { redirect_to(@blessing, :notice => 'Gratitude was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blessing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blessings/1
  # DELETE /blessings/1.xml
  def destroy
    @blessing = Blessing.find(params[:id])
    @blessing.destroy

    respond_to do |format|
      format.html { redirect_to(blessings_url) }
      format.xml  { head :ok }
    end
  end
end
