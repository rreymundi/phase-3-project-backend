puts "🗑️ Clearing old data..."
    User.destroy_all
    List.destroy_all
    Task.destroy_all

puts "🌱 Seeding data..."

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
    list_id: 1,
    status: false
)

Task.create(
    name: "Phase 3 project",
    description: "Finish backend setup",
    saved: false,
    list_id: 2,
    status: false
)

Task.create(
    name: "Dinner ingredients",
    description: "Get ingredients for tonight's dinner",
    saved: false,
    list_id: 3,
    status: false
)

Task.create(
    name: "Internet",
    description: "Call internet company to ask about service upgrade",
    saved: false,
    list_id: 4,
    status: false
)

puts "✅ Done seeding!"