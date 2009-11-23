class LoginController < ApplicationController
  def login
    flash[:login_error] = nil
    username = params[:username]
    password = params[:passwd]
    session[:is_admin] = false
    if !username.nil? && !password.nil? 
      if username == ADMIN_USERNAME && password == ADMIN_PASSWORD
        session[:is_admin] = true
      else
        owner = Owner.find(:first,:conditions => ["username = ? and password = ?",username,password])
        if owner
          session[:owner_team] = owner.team
        else
          flash[:login_error] = "Nom d'usager ou mot de passe invalide!"
        end
      end
    else
      flash[:login_error] = "Nom d'usager ou mot de passe invalide!"
    end
    
    redirect_to :controller => "static", :action => "index"
  end
  
  def logout
    session[:is_admin] = false
    session[:owner_team] = nil
    redirect_to :controller => "static", :action => "index"
  end
end
