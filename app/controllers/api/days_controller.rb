class Api::DaysController < ApplicationController
  def index

  end

  # JOSH
  # I know this is messy now, but it will change as we add functionality to the application.
  # A good portion of this can be moved over to the User model eventually, it will help keep
  # the code more DRY
  def show
    if params[:date].present?
      date = DateTime.parse(params[:date])
      session[:current_date] = date
    elsif session[:current_date].present?
      date = DateTime.parse(session[:current_date])
    else
      date = DateTime.now
      session[:current_date] = date
    end
    if params[:week].present?
      days = Array.new
      counter = date.beginning_of_week
      end_date = date.end_of_week - 2.days

      until counter > end_date
        day = Hash.new
        day[:date] = counter.strftime("%d").to_i
        day[:name] = counter.strftime("%A")
        day[:month] = counter.strftime("%b")
        day[:events] = Array.new
        if counter.to_date == DateTime.now.to_date
          day[:today] = 'today'
        else
          day[:today] = ''
        end
        if current_user.role == "Student"
          day[:meetings] = Meeting.where(start_time: counter.beginning_of_day..counter.end_of_day).map{|m|
            {
                id: m.id,
                professor_id: m.professor_id,
                professor_name: User.find(m.professor_id).name,
                start_hour: m.start_time.strftime("%H").to_i,
                start_minutes: m.start_time.strftime("%M").to_i,
                length: (m.end_time.to_i - m.start_time.to_i)/60,
                name: "Meeting with #{User.find(m.professor_id).name}",
                label: Course.where(id: m.course_id).first.label
            }
          }
        else
          day[:meetings] = Meeting.where(start_time: counter.beginning_of_day..counter.end_of_day).map{|m|
            {
                id: m.id,
                professor_id: m.professor_id,
                professor_name: User.find(m.professor_id).name,
                start_hour: m.start_time.strftime("%H").to_i,
                start_minutes: m.start_time.strftime("%M").to_i,
                length: (m.end_time.to_i - m.start_time.to_i)/60,
                name: "Meeting with #{User.find(m.professor_id).name}",
                label: Course.where(id: m.course_id).first.label
            }
          }
        end

        days.push day
        counter += 1.day
      end

      render json: days.to_json
    else
      day = Hash.new
      day[:date] = counter.strftime("%d").to_i
      day[:name] = counter.strftime("%A").to_i
      day[:events] = Array.new
      if date.to_date == DateTime.now.to_date
        day[:today] = 'today'
      else
        day[:today] = ''
      end
      if current_user.role == "Student"
        day[:meetings] = Meeting.where(start_time: counter.beginning_of_day..counter.end_of_day).map{|m|
          {
              id: m.id,
              professor_id: m.professor_id,
              professor_name: User.find(m.professor_id).name,
              start_hour: m.start_time.strftime("%H").to_i,
              start_minutes: m.start_time.strftime("%M").to_i,
              length: (m.end_time.to_i - m.start_time.to_i)/60,
              name: "Meeting with #{User.find(m.professor_id).name}",
              label: Course.where(id: m.course_id).first.label
          }
        }
      else
        day[:meetings] = Meeting.where(start_time: counter.beginning_of_day..counter.end_of_day).map{|m|
          {
              id: m.id,
              professor_id: m.professor_id,
              professor_name: User.find(m.professor_id).name,
              start_hour: m.start_time.strftime("%H").to_i,
              start_minutes: m.start_time.strftime("%M").to_i,
              length: (m.end_time.to_i - m.start_time.to_i)/60,
              name: "Meeting with #{User.find(m.professor_id).name}",
              label: Course.where(id: m.course_id).first.label
          }
        }
      end

      render json: day.to_json
    end
  end
end
