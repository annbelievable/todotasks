# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

status = ['done','undone','started','on going','few mistakes','fixed']

ActiveRecord::Base.transaction do
  10.times do
    task = {}
    task['title'] = Faker::Name.first_name
    task['description'] = Faker::Internet.email
    task['status'] = status.sample
    Task.create(task)
  end
end

ActiveRecord::Base.transaction do
  50.times do
    subtask = {}
    subtask['title'] = Faker::Address.city
    subtask['description'] = Faker::Address.street_address
    subtask['status'] = status.sample
    subtask['task_id'] = rand(1..10)
    Subtask.create(subtask)
  end
end
