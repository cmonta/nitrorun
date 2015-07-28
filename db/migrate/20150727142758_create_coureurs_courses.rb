class CreateCoureursCourses < ActiveRecord::Migration
  def change
    create_table :coureurs_courses, :id => false do |t|
      t.integer :coureur_id, :null => false
      t.integer :course_id, :null => false
    end
    # Add table index
    add_index :coureurs_courses, [:coureur_id, :course_id], :unique => true
  end
end
