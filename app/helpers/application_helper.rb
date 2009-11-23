# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def admin(&block)
    return false unless is_admin?
    concat("<span class='admin'>",block.binding)
    yield 
    concat("</span>",block.binding)
  end
  def team_owner(team_id,&block)
    return false unless is_admin? || (is_team_owner? && owner_team.id == team_id)
    concat("<span class='admin'>",block.binding)
    yield 
    concat("</span>",block.binding)
  end
  
  
  def menu_active(menu_controller,menu_action)
    if controller.controller_name== menu_controller && controller.action_name == menu_action
      'active'
    end
  end
end
