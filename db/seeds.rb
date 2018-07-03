
# Add user levels
user_levels = {
    admin:  9999,
    high:   10,
    medium: 8,
    low:    6,
    anyone: 1
}

user_levels.each do |title, level|
  UserLevel.where(title: title.to_s, level: level).first_or_create!
end
