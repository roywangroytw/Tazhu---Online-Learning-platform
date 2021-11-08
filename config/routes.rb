Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # path 1: "/" 根目錄
  get "/", to: "pages#index"
  # 舊式的寫法：get "/", controller: "pages", action: "index"

end
