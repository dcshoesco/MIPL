class PlayersController < ApplicationController
  before_filter :must_be_admin,:only => [:show]
  before_filter :must_be_owner_or_admin, :only => [:index,:new,:create] 
  before_filter :must_be_owner,:only => [:edit,:update,:destroy]
  # GET /players
  # GET /players.xml
  def index
    @subtitle = ''
    if(is_team_owner?)
      @players = Player.find(:all,:conditions => ["team_id = ?",owner_team.id])
      @subtitle = owner_team.name
    else
      @players = Player.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @players }
    end
  end

  # GET /players/1
  # GET /players/1.xml
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/new
  # GET /players/new.xml
  def new
    @subtitle = ''
    @player = Player.new
    if is_team_owner?
      @subtitle = "pour " + owner_team.name
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.xml
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        flash[:notice] = 'Player was successfully created.'
        format.html { redirect_to(:action => "index") }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        flash[:notice] = 'Player was successfully updated.'
        format.html { redirect_to(:action => "index") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(players_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def must_be_owner_or_admin
    return true if is_admin? || is_team_owner?
    redirect_to :controller => "static", :action => "index"
  end
  def must_be_owner
    return true if is_admin? || (is_team_owner? && owner_team.id == Player.find(params[:id]).team.id )
    redirect_to :controller => "static", :action => "index"
  end
end
