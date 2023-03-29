
require 'active_record'


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'tasks.db'
)

class Task < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :status, inclusion: { in: %w[в очікуванні в роботі завершені], message: "Недопустимий статус" }
end

ActiveRecord::Schema.define do
  create_table :tasks do |table|
    table.column :name, :string
    table.column :description, :string
    table.column :status, :string
    table.timestamps null: false
  end
end

Task.create(name: "Прибрати кімнату", description: "Прибрати кімнату від залишків святкування", status: "в роботі")

Task.all.each do |task|
  puts "#{task.name}: #{task.description} (#{task.status})"
end