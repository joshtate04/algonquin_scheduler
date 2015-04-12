class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :professor_id
      t.integer :student_id
      t.datetime :start_time
      t.integer :end_time

      t.timestamps null: false
    end
  end
end
