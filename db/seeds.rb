
# Add user levels
user_levels = [
  {id: 1, title: 'admin',  level: 9999,},
  {id: 2, title: 'high',   level: 10,},
  {id: 3, title: 'medium', level: 8,},
  {id: 4, title: 'low',    level: 6,},
  {id: 5, title: 'anyone', level: 1}
]

user_levels.each do |details|
  UserLevel.where(id: details[:id], title: details[:title], level: details[:level]).first_or_create!
end
