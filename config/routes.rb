Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    scope module: :v1 do
      devise_for :managers, path: "auth", path_names: {sign_in: "login",
        sign_out: "logout", password: "secret", confirmation: "verification",
        registration: "register", sign_up: "cmon_let_me_in"}
      resources :users
      resources :items
    end
  end
end
