puts "🗑️ Clearing old data..."
    User.destroy_all
    List.destroy_all
    Task.destroy_all

puts "🌱 Seeding data..."

User.create(
    username: "raulreymundi",
    password: "123456789"
)

User.create(
    username: "gabibenedit",
    password: "987654321"
)

List.create(
    name: "Work"
)

List.create(
    name: "School"
)

List.create(
    name: "Groceries"
)

List.create(
    name: "Bills"
)

Task.create(
    name: "Quarterly report",
    description: "Share slide deck with team",
    saved: false,
    user_id: 1,
    list_id: 1
)

Task.create(
    name: "Phase 3 project",
    description: "Finish backend setup",
    saved: false,
    user_id: 1,
    list_id: 2
)

Task.create(
    name: "Dinner ingredients",
    description: "Get ingredients for tonight's dinner",
    saved: false,
    user_id: 2,
    list_id: 3
)

Task.create(
    name: "Internet",
    description: "Call internet company to ask about service upgrade",
    saved: false,
    user_id: 2,
    list_id: 4
)

puts "✅ Done seeding!"