Rails.application.routes.draw do
  get '/templates.js' => 'monster_templates#index'
end
