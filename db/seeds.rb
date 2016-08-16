# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.create(title: "Genius Title 1", body: "Genius Body 1", quality: 2)
Idea.create(title: "Genius Title 2", body: "Genius Body 2", quality: 2)

Idea.create(title: "Plausible Title 1", body: "Plausible Body 1", quality: 1)
Idea.create(title: "Plausible Title 2", body: "Plausible Body 2", quality: 1)

Idea.create(title: "Swill Title 1", body: "Swill Body 1")
Idea.create(title: "Swill Title 2", body: "Swill Body 2")
