Rails.application.routes.draw do
  scope '/api' do
    get '/timesheets', to: 'timesheets#index'
    post '/timesheets', to: 'timesheets#create'
    get '/timesheets/:id', to: 'timesheets#show'
    put '/timesheets/:id', to: 'timesheets#update'
    delete '/timesheets/:id', to: 'timesheets#destroy'
  end
end

