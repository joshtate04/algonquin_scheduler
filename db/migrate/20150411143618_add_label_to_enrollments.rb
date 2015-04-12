class AddLabelToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :label, :string
  end
end
