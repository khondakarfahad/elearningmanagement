Rails.application.routes.draw do
  resources :registrations
  resources :courses
  resources :lessons
  resources :exams
  resources :questions
  resources :users
end
