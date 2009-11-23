class LeaguePostsController < ApplicationController
  before_filter :must_be_admin, :only => [:new,:edit,:create,:update,:destroy] 
  # GET /league_posts
  # GET /league_posts.xml
  def index
    @league_posts = LeaguePost.paginate :page => params[:page], :order => 'created_at DESC',:per_page => 2

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @league_posts }
    end
  end

  # GET /league_posts/1
  # GET /league_posts/1.xml
  def show
    @league_post = LeaguePost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @league_post }
    end
  end

  # GET /league_posts/new
  # GET /league_posts/new.xml
  def new
    @league_post = LeaguePost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @league_post }
    end
  end

  # GET /league_posts/1/edit
  def edit
    @league_post = LeaguePost.find(params[:id])
  end

  # POST /league_posts
  # POST /league_posts.xml
  def create
    @league_post = LeaguePost.new(params[:league_post])

    respond_to do |format|
      if @league_post.save
        flash[:notice] = 'LeaguePost was successfully created.'
        format.html { redirect_to(@league_post) }
        format.xml  { render :xml => @league_post, :status => :created, :location => @league_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @league_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /league_posts/1
  # PUT /league_posts/1.xml
  def update
    @league_post = LeaguePost.find(params[:id])

    respond_to do |format|
      if @league_post.update_attributes(params[:league_post])
        flash[:notice] = 'LeaguePost was successfully updated.'
        format.html { redirect_to(@league_post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @league_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /league_posts/1
  # DELETE /league_posts/1.xml
  def destroy
    @league_post = LeaguePost.find(params[:id])
    @league_post.destroy

    respond_to do |format|
      format.html { redirect_to(league_posts_url) }
      format.xml  { head :ok }
    end
  end
end
