class AddCourseToMeeting < ActiveRecord::Migration
  def change
    add_reference :meetings, :course, index: true
    add_foreign_key :meetings, :courses
  end
end
