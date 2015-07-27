class CreateCoureurs < ActiveRecord::Migration
  def change
    create_table :coureurs do |t|
      t.string :pseudo
      t.string :ville
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
