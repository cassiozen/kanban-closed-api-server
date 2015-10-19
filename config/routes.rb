Rails.application.routes.draw do
  resources :cards, defaults: {format: :json} do
    member { put :sort }
    resources :tasks, defaults: {format: :json}
  end
end
