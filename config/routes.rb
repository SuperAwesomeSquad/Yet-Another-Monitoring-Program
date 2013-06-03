YetAnotherMonitoringProgram::Application.routes.draw do
require 'sidekiq/web'

devise_for :users

%w[about contact license].each do |page|
  get page, controller: 'static', action: page
end

authenticated :user do
  root :to => 'dashboard#index'
end

root :to => 'static#welcome'

resources :monitors

resources :alerts

get '/lsp',
  :to => 'lumpys#index',
  :as => 'lsp'

ActiveAdmin.routes(self)

authenticate :user do
  mount Sidekiq::Web, at: '/sidekiq'
end

end
