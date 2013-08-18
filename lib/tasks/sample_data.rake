namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Test User",
                 email: "testuser@ub.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@ub.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

   def make_microposts
  users = User.all(limit: 6)
  50.times do
    title = "Java - #{n+1}"
    description = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(title: title,
                                                 description: description) }
  end
end

  def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
  end
  end
end