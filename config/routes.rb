Rails.application.routes.draw do
  scope '/api' do
    get '/timesheets', to: 'timesheets#index'
    post '/timesheets', to: 'timesheets#create'
    get '/timesheets/:id', to: 'timesheet#show'
    put '/timesheets/:id', to: 'timesheet#update'
    delete '/timesheets/:id', to: 'timesheet#destroy'
  end
end

