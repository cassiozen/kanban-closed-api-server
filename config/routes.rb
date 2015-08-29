Rails.application.routes.draw do
  resources :cards, defaults: {format: :json} do
    resources :tasks, defaults: {format: :json}
  end
end
