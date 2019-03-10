class MainController < ApplicationController
  before_action :subscribers_information! 
  before_action :set_course, only: [:course_index]
  before_action :set_group, only: [:groups]
  before_action :set_subscribe, only: [:subscribe]

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
    @logged_in_user = Subscriber.where(user_id: current_user.id)

    @logged_in_user = @logged_in_user.first

    @courses = Course.where(subscriber_id: @logged_in_user)

    puts @courses.first
    authorize @courses
  end

  def course_index
  end

  def groups
    
  end

  def subscribe
    @subscribe = Subscription.new

    authorize @subscribe
  end
private
  def set_course
    @course = Course.find(params[:id])
    
    authorize @course
  end

  

  def subscribers_information!
    if current_user
      @user_id = current_user.id
      
      @subs = Subscriber.where(user_id: @user_id)
      
      if @subs.blank?
        redirect_to new_subscriber_path
      end

    end
  end

  def set_subscribe
    
  end
end
