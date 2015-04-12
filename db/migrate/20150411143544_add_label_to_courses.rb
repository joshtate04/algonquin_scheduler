class AddLabelToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :label, :string
  end
end
