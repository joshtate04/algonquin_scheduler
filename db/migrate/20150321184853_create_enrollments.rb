class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :enrollments, :users
    add_foreign_key :enrollments, :courses
  end
end
