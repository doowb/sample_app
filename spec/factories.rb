Factory.define :user do |user|
  user.name                   "Brian Woodward"
  user.email                  "brian.woodward@gmail.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
