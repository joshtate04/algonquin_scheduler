class Course < ActiveRecord::Base
  belongs_to :professor, class_name: "User"
end
