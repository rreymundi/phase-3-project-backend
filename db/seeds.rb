puts "🗑️ Clearing old data..."
    User.destroy_all
    List.destroy_all
    Task.destroy_all

puts "🌱 Seeding data..."

2.times do
    User.create(
        username: Faker::Name.name,
        password: Faker::String.random(length: 10..14),
    )
end

10.times do
	List.create(
		name: Faker::Lorem.words(number: 3),
	)
end

50.times do
    Task.create(
      name: Faker::Lorem.words(number: 2),
      description: Faker::Lorem.sentence(word_count: 4),
      saved: Faker::Boolean.boolean,
      user_id: User.pluck( :id ).sample,
      list_id: List.pluck( :id ).sample
    )
end

puts "✅ Done seeding!"