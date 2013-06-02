YetAnotherMonitoringProgram::Application.routes.draw do
require 'sidekiq/web'

devise_for :users
root :to => 'static#welcome'

%w[about contact license].each do |page|
  get page, controller: 'static', action: page
end

# get '/dashboard',
#   :to => 'dashboard#index',
#   :as => '/dashboard'

namespace :dashboard do
    get '', to: 'dashboard#index', as: '/'
end

# match "dashboard" => "monitors#show"

resources :monitors

resources :alerts

get '/lsp',
  :to => 'lumpys#index',
  :as => 'lsp'

authenticated :user do
  root :to => "dashboard#index"
end

ActiveAdmin.routes(self)

mount Sidekiq::Web, at: '/sidekiq'

end
