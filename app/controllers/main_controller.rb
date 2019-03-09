class MainController < ApplicationController
  before_action :subscribers_information!

  after_action :verify_authorized

  def index
  end

  def home
    @courses = Course.all

    @logged_in_user = Subscriber.where(user_id: current_user.id)


    @logged_in_user = @logged_in_user.first

    authorize @logged_in_user
  end

  def students_list
    @students = Subscriber.where(substype: '2')
    puts @students.first

    authorize @students
  end

  def courses_offered
    @courses = Course.where(user_id: current_user.id)

    authorize @courses
  end
private

  def subscribers_information!
    if current_user
      @user_id = current_user.id
      
      @subs = Subscriber.where(user_id: @user_id)
      
      if @subs.blank?
        redirect_to new_subscriber_path
      end

    end
  end
end
