class PhotosController < ApplicationController
  before_filter :must_be_admin, :only => [:show,:new,:edit,:create,:update,:destroy,:refresh_from_ftp] 
  # GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.all
    @photos_general = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'general'])
    @photos_event1 = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'event1'])
    @photos_event2 = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'event2'])
    @photos_event3 = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'event3'])
    @photos_event4 = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'event4'])
    @photos_event5 = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'event5'])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  #index.xml.erb
    end
  end
  
  def refresh_from_ftp
    # Logic to update from FTP
    #Create photo for General
    update_picture 'general'
    update_picture 'event1'
    update_picture 'event2'
    update_picture 'event3'
    update_picture 'event4'
    update_picture 'event5'
    
  end
  
  # GET /photos/home_player
  def home_player
    @photos = Photo.find(:all,:limit => 10,:order => 'created_at DESC')
   
    render :action => :index
  end
  
  # GET /photos/general
  def general
    @photos = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'general'])
   
    render :action => :index
  end
  
  # GET /photos/event1
  def event1
    @photos = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'event1'])
   
    render :action => :index
  end
  # GET /photos/event2
  def event2
    @photos = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'event2'])
   
    render :action => :index
  end
  # GET /photos/event3
  def event3
    @photos = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'event3'])
   
    render :action => :index
  end
  # GET /photos/event4
  def event4
    @photos = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'event4'])
   
    render :action => :index
  end
  # GET /photos/event5
  def event5
    @photos = Photo.find(:all,:order => 'created_at DESC',:conditions => ["category = ?",'event5'])
   
    render :action => :index
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        flash[:notice] = 'Photo was successfully created.'
        format.html { redirect_to(@photo) }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        flash[:notice] = 'Photo was successfully updated.'
        format.html { redirect_to(@photo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(photos_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def update_picture(type)
    path = APP_CONFIG['path_photo'] + '/' + type
    if File.exist?(path)
      d = Dir.new(path)
      d.each do |f| 
        ff = path + '/' + f
        if File.file?(ff)
          p = Photo.create(:title => f,:file => File.open(ff),:category => type)
          p.save
          File.delete(ff)
        end
      end
    else
      Dir.mkdir(path)
    end
  end
end
