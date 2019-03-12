Rails.application.routes.draw do
  resources :groups
  resources :courses
  devise_for :users
  resources :subscribers
  get 'main/index'
  get 'main/home' => 'main#home', as: :home

  get 'main/students_list' => 'main#students_list', as: :students_list
  post 'main/students_list_filtered' => 'main#students_list_filtered', as: :students_list_filtered
  post 'main/group_filtered' => 'main#group_filtered', as: :group_filtered

  get 'main/all_group' => 'main#all_group', as: :all_group

  get 'main/courses_offered' => 'main#courses_offered', as: :courses_offered
  get 'main/course_index/:id' => 'main#course_index', as: :course_index
  get 'main/my_group/:course_id' => 'main#my_group', as: :my_group

  get 'groups/filtered_groups/:course_id' => 'groups#filtered_groups', as: :filtered_groups

  get 'groups/new/:course_id' => 'groups#new', as: :new_specific_group

  get 'main/subscribed_students/:course_id' => 'main#subscribed_students', as: :subscribed_students
  get 'main/grades/:course' => 'main#grades', as: :grades
  get 'main/add_grade/:subcription/grade/:grade' => 'main#add_grade', as: :add_grade
  get 'main/courses_taken' => 'main#courses_taken', as: :courses_taken
  get 'main/subscribe/:course_id' => 'main#subscribe', as: :subscribe

  post 'main/subscriptions' => 'main#subscriptions', as: :subscriptions
  delete 'main/unsubscriptions/:course_id' => 'main#unsubscriptions', as: :unsubscriptions


  get 'main/add_members/:group/course/:course' => 'main#add_members', as: :add_members
  get 'main/show_members/:group' => 'main#show_members', as: :show_members
  
  get 'main/attendance/:course_id' => 'main#attendance', as: :attendance

  get 'main/finished_class/:course_id' => 'main#finished_class', as: :finished_class

  get 'main/give_attendance/:course_id' => 'main#give_attendance', as: :give_attendance
  
  get 'main/added_members/:attendance/group/:group/course/:course' => 'main#added_members', as: :added_members
  get 'main/removed_members/:attendance/group/:group/course/:course' => 'main#removed_members', as: :removed_members

  get 'main/submit_or_edit_group/:group' => 'main#submit_or_edit_group', as: :submit_or_edit_group

  post 'main/changed_group' => 'main#changed_group', as: :changed_group

  root 'main#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
