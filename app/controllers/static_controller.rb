class StaticController < ApplicationController
  def index
    @league_posts = LeaguePost.find(:all,:limit => 4,:order => 'created_at DESC')
    @team_posts = TeamPost.find(:all,:limit => 6,:order => 'created_at DESC')
    @sponsors = Sponsor.all
  end

  def rules
  end

  def contact
  end

  
end
