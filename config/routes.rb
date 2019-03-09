Rails.application.routes.draw do
  resources :courses
  devise_for :users
  resources :subscribers
  get 'main/index'
  get 'main/home' => 'main#home', as: :home_path
  get 'main/students_list' => 'main#students_list', as: :students_list

  get 'main/courses_offered' => 'main#courses_offered', as: :courses_offered

  root 'main#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
