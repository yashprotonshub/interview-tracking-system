Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    get "/interview_requests", to:"users#interview_requests", as:"interview_requests"
    get "/profile", to:"users#profile", as:"profile"
    get "/interviewer_profile", to:"users#interviewer_profile", as:"interviewer_profile"
    get "/scheduled_interviews", to:"users#scheduled_interviews", as:"scheduled_interviews"
    post "/candidate_rejection", to:"applicant_informations#candidate_rejection", as:"candidate_rejection"
    get "/user_status", to:"users#user_status", as:"user_status"
    resources :applicant_informations
    resources :interviewer_profiles
  end
  root "users#index"
end
