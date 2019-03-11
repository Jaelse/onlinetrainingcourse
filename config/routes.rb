Rails.application.routes.draw do
  resources :groups
  resources :courses
  devise_for :users
  resources :subscribers
  get 'main/index'
  get 'main/home' => 'main#home', as: :home
  get 'main/students_list' => 'main#students_list', as: :students_list

  get 'main/courses_offered' => 'main#courses_offered', as: :courses_offered
  get 'main/course_index/:id' => 'main#course_index', as: :course_index


  get 'groups/filtered_groups/:id' => 'groups#filtered_groups', as: :filtered_groups

  get 'groups/new/:course_id' => 'groups#new', as: :new_specific_group

  get 'main/subscribed_students/:course_id' => 'main#subscribed_students', as: :subscribed_students
  get 'main/grades' => 'main#grades', as: :grades
  get 'main/courses_taken' => 'main#courses_taken', as: :courses_taken
  get 'main/subscribe/:course_id' => 'main#subscribe', as: :subscribe

  post 'main/subscriptions' => 'main#subscriptions', as: :subscriptions
  delete 'main/unsubscriptions/:course_id' => 'main#unsubscriptions', as: :unsubscriptions


  get 'main/add_members/:group' => 'main#add_members', as: :add_members
  get 'main/show_members/:group' => 'main#show_members', as: :show_members
  
  get 'main/attendance/:course_id' => 'main#attendance', as: :attendance

  get 'main/finished_class/:course_id' => 'main#finished_class', as: :finished_class

  get 'main/give_attendance/:course_id' => 'main#give_attendance', as: :give_attendance
  
  root 'main#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
