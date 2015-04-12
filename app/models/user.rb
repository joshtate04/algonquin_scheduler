class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :enrollments

  def name
    "#{first_name} #{last_name}"
  end

  def courses
    if role == "Student"
      return enrollments.map{|e| e.course}
    elsif role == "Faculty"
      return Course.where(user_id: id)
    end
  end
end
