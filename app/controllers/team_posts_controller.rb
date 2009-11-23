class TeamPostsController < ApplicationController
  before_filter :must_be_admin, :only => [:index,:show]
  before_filter :must_be_owner_or_admin, :only => [:new,:edit,:create,:update,:destroy] 
  # GET /team_posts
  # GET /team_posts.xml
  def index
    @team_posts = TeamPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @team_posts }
    end
  end

  # GET /team_posts/1
  # GET /team_posts/1.xml
  def show
    @team_post = TeamPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @team_post }
    end
  end

  # GET /team_posts/new
  # GET /team_posts/new.xml
  def new
    @subtitle = ''
    @team_post = TeamPost.new
    if is_team_owner?
      @subtitle = "pour " + owner_team.name
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @team_post }
    end
  end

  # GET /team_posts/1/edit
  def edit
    @team_post = TeamPost.find(params[:id])
  end

  # POST /team_posts
  # POST /team_posts.xml
  def create
    @team_post = TeamPost.new(params[:team_post])

    respond_to do |format|
      if @team_post.save
        flash[:notice] = 'TeamPost was successfully created.'
        format.html { redirect_to(@team_post.team) }
        format.xml  { render :xml => @team_post, :status => :created, :location => @team_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @team_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /team_posts/1
  # PUT /team_posts/1.xml
  def update
    @team_post = TeamPost.find(params[:id])

    respond_to do |format|
      if @team_post.update_attributes(params[:team_post])
        flash[:notice] = 'TeamPost was successfully updated.'
        format.html { redirect_to(@team_post.team) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @team_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /team_posts/1
  # DELETE /team_posts/1.xml
  def destroy
    team = @team_post.team
    @team_post = TeamPost.find(params[:id])
    @team_post.destroy

    respond_to do |format|
      format.html { redirect_to(team) }
      format.xml  { head :ok }
    end
  end
  
  private
  def must_be_owner_or_admin
    return true if is_admin? || is_team_owner?
    redirect_to :controller => "static", :action => "index"
  end
end
