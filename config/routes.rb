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
    get "/all_interviewers_list", to:"users#all_interviewers_list", as:"all_interviewers_list"
    patch "/update_candidate_interview_status", to:"candidate_interviews#update_candidate_interview_status", as:"update_candidate_interview_status"
    get "/update_candidate_interview_status_entry", to:"candidate_interviews#update_candidate_interview_status_entry", as:"update_candidate_interview_status_entry"
    get "/all_scheduled_interviews_for_interviewers", to:"users#all_scheduled_interviews_for_interviewers", as:"all_scheduled_interviews_for_interviewers"
    patch "/update_candidate_interview_feedback", to:"candidate_interviews#update_candidate_interview_feedback", as:"update_candidate_interview_feedback"
    resources :applicant_informations
    resources :interviewer_profiles
    resources :candidate_interviews, only: [:create, :new, :update]
  end
  root "users#index"
end
