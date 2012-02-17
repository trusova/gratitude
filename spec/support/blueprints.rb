require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

User.blueprint do
  email { "foo@bar.com" }
  password { "password" }
  name { "Bob" }
end

Gratitude.blueprint do
  answer  { "A beatutiful day" }
end