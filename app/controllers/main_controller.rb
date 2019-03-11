class MainController < ApplicationController
  before_action :subscribers_information! 
  before_action :set_course, only: [:course_index]
  before_action :set_group, only: [:groups]

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
    @subscription = Subscription.new

    authorize @subscription
  end

  def unsubscribe
    @subscription = Subscription.new

    authorize @subscription
  end

  def subscriptions
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      @successful = true
    else
      @successful = false 
      @notice = @subscription.errors.full_messages
    end

    authorize @subscription
  end

  def unsubscriptions
    @unsubscription = Subscription.find_by( course_id: params[:course_id], subscriber_id: Subscriber.find_by(user_id: current_user.id).id)

    if @unsubscription.destroy
      @successful = true
    else
      @successful = false 
      @notice = @unsubscription.errors.full_messages
    end

    authorize @unsubscription
  end

  def courses_taken
    @logged_in_user = Subscriber.where(user_id: current_user.id)

    @logged_in_user = @logged_in_user.first

    @courses_taken = Subscription.where( subscriber_id: @logged_in_user.id)

    authorize @courses_taken
  end

  def grades
  
  end

  def subscribed_students
    @subsribed_students = Subscription.where(course_id: params[:course_id])

    puts @subsribed_students.methods - Object.methods

    authorize @subsribed_students
  end

  def add_members 
  
  end

  def show_members
    
  end

  def attendance
    @logged_in_user = Subscriber.where(user_id: current_user.id)
    
    @start_class = Log.new( course_id: params[:course_id], class_date: Date.current(), class_started: true, class_ended: false)

    if !Course.find_by( id: params[:course_id], subscriber_id: @logged_in_user.first.id).nil?
      if !Log.where(course_id: params[:course_id], class_date: Date.current(), class_started: true, class_ended: false).exists?
        if @start_class.save
          @started = true
          @giving_attendance = Attendance.where( class_date: Date.current(), course_id: params[:course_id])
        end
      elsif Log.where(course_id: params[:course_id], class_date: Date.current(), class_started: true, class_ended: true).exists?
        @finished = true
        @giving_attendance = Attendance.where( class_date: Date.current(), course_id: params[:course_id])
      else !Log.where(course_id: params[:course_id], class_date: Date.current(), class_started: true, class_ended: false).exists?
        @class_going = true
        @giving_attendance = Attendance.where( class_date: Date.current(), course_id: params[:course_id])
      end
    end
    
    authorize @start_class
  end

  def finished_class
    @logged_in_user = Subscriber.where(user_id: current_user.id)

    @finish_class_of = Log.find_by(course_id: params[:course_id], class_date: Date.current(), class_started: true)
    
    @finish_class_of.class_ended = true

    if @finish_class_of.save
      @finished = true
    end

    authorize @finish_class_of
  end

  def give_attendance
    @logged_in_user = Subscriber.where(user_id: current_user.id)

    @subscription = Subscription.find_by( subscriber_id: @logged_in_user.first.id, course_id: params[:course_id])

    @attendance = Attendance.new( subscription_id: @subscription.id, class_date: Date.current(), course_id: params[:course_id])
  
    if !@subscription.nil?
      if !Log.find_by(course_id: params[:course_id], class_date: Date.current(), class_started: true, class_ended: false).nil?
        if Attendance.find_by(subscription_id: @subscription.id, class_date: Date.current(), course_id: params[:course_id]).nil?
          if @attendance.save
            flash[:success] = "Attendance Registered"
          else
            flash[:success] = "Attendance not registered due to some problem. Please try again."
          end
        else
          flash[:error] = "Already Gave attendance"
        end
      else
        flash[:error] = "Class not started or finished"
      end
    else
      flash[:error] = "Not subsribed"
    end

    authorize @attendance
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

  def subscription_params
    params.require(:subscription).permit(:subscriber_id, :course_id)
  end
end
