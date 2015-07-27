class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :nom
      t.string :distance
      t.string :ville
      t.date :date
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end
