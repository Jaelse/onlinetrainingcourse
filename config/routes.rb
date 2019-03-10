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

  get 'main/subscribe/:course_id' => 'main#subscribe', as: :subscribe

  post 'main/subscriptions' => 'main#subscriptions', as: :subscriptions

  root 'main#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
