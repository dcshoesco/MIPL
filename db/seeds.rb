# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Team.create(:name => 'Shadow Warrior',:phone => '514-880-9494',:email=>'mtrepanier94@sympatico.ca',
  :owner => Owner.create(:firstname => 'Martin',:lastname => 'Trepanier',:phone => '',:email => '',:username => 'shadow',:password => 'pass'))
  
Team.create(:name => 'Equipe disponible',:phone => '',:email=>'',
  :owner => Owner.create(:firstname => 'firstname',:lastname => 'lastname',:phone => '',:email => '',:username => 'teams1',:password => 'pass'))
  
Team.create(:name => 'Equipe disponible',:phone => '',:email=>'',
  :owner => Owner.create(:firstname => 'firstname',:lastname => 'lastname',:phone => '',:email => '',:username => 'teams2',:password => 'pass'))
  
Team.create(:name => 'Equipe disponible',:phone => '',:email=>'',
  :owner => Owner.create(:firstname => 'firstname',:lastname => 'lastname',:phone => '',:email => '',:username => 'teams3',:password => 'pass'))
  
Team.create(:name => 'Equipe disponible',:phone => '',:email=>'',
  :owner => Owner.create(:firstname => 'firstname',:lastname => 'lastname',:phone => '',:email => '',:username => 'teams4',:password => 'pass'))
  
Team.create(:name => 'Equipe disponible',:phone => '',:email=>'',
  :owner => Owner.create(:firstname => 'firstname',:lastname => 'lastname',:phone => '',:email => '',:username => 'teams5',:password => 'pass'))
                    
Event.create(:date => '2009-05-23',:field => 'Mirabel',
  :games => Game.create([
    {:time => '9h00',:team_away_id => 6,:team_home_id => 5},
    {:time => '10h00',:team_away_id => 3,:team_home_id => 1},
    {:time => '11h00',:team_away_id => 4,:team_home_id => 2},
    {:time => '12h30',:team_away_id => 6,:team_home_id => 3},
    {:time => '13h30',:team_away_id => 2,:team_home_id => 1},
    {:time => '14h30',:team_away_id => 5,:team_home_id => 4}
  ]))

Event.create(:date => '2009-06-20',:field => 'Mirabel',
  :games => Game.create([
    {:time => '9h00',:team_away_id => 3,:team_home_id => 2},
    {:time => '10h00',:team_away_id => 4,:team_home_id => 6},
    {:time => '11h00',:team_away_id => 1,:team_home_id => 5},
    {:time => '12h30',:team_away_id => 5,:team_home_id => 3},
    {:time => '13h30',:team_away_id => 2,:team_home_id => 6},
    {:time => '14h30',:team_away_id => 1,:team_home_id => 4}
  ]))
  
Event.create(:date => '2009-07-18',:field => 'Mirabel',
  :games => Game.create([
    {:time => '9h00',:team_away_id => 5,:team_home_id => 2},
    {:time => '10h00',:team_away_id => 6,:team_home_id => 1},
    {:time => '11h00',:team_away_id => 4,:team_home_id => 3},
    {:time => '12h30',:team_away_id => 5,:team_home_id => 6},
    {:time => '13h30',:team_away_id => 1,:team_home_id => 3},
    {:time => '14h30',:team_away_id => 2,:team_home_id => 4}
  ]))
  
Event.create(:date => '2009-08-29',:field => 'Mirabel',
  :games => Game.create([
    {:time => '9h00',:team_away_id => 3,:team_home_id => 6},
    {:time => '10h00',:team_away_id => 1,:team_home_id => 2},
    {:time => '11h00',:team_away_id => 4,:team_home_id => 5},
    {:time => '12h30',:team_away_id => 2,:team_home_id => 3},
    {:time => '13h30',:team_away_id => 6,:team_home_id => 4},
    {:time => '14h30',:team_away_id => 5,:team_home_id => 1}
  ]))
  
Event.create(:date => '2009-09-26',:field => 'Mirabel',
  :games => Game.create([
    {:time => '9h00',:team_away_id => 3,:team_home_id => 5},
    {:time => '10h00',:team_away_id => 6,:team_home_id => 2},
    {:time => '11h00',:team_away_id => 4,:team_home_id => 1},
    {:time => '12h30',:team_away_id => 2,:team_home_id => 5},
    {:time => '13h30',:team_away_id => 1,:team_home_id => 6},
    {:time => '14h30',:team_away_id => 3,:team_home_id => 4}
  ]))