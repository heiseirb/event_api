# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |i|
  password = Digest::SHA1.hexdigest(i.to_s)
  User.create!(
    name: Faker::Games::Pokemon.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    role: %w(owner normal).sample
  )
end

eventers = User.where(role: :owner)
eventers.each do |eventer|
  10.times do
    event = eventer.owner_events.create!(
      place: Faker::Games::Pokemon.location,
      description: Faker::Beer.name
    )

    Random.rand(1..10).times do
      event.schedules.create!(
        date: Faker::Date.between(2.days.ago, Time.zone.today),
        capacity: Random.rand(1..300)
      )
    end
  end
end

taishu = User.where(role: :normal)

EventSchedule.order('random()').limit(1000).each do |schedule|
  Random.rand(1..10).times do
    schedule.user_to_event_schedules.create!(user_id: taishu.sample.id)
  end
end

EventSchedule.order('random()').limit(1000).each(&:lottery)
