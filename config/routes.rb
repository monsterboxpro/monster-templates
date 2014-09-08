Rails.application.routes.draw do
  get '/templates' => 'monster_templates#index'
end
