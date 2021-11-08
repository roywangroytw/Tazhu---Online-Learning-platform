Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # path 1: "/" 根目錄
  get "/", to: "pages#index"
  # 舊式的寫法：get "/", controller: "pages", action: "index"
  # root "pages#index" 根目錄這樣寫法更好看

  # path 2: "/about" 關於我們，靜態網頁直接共享pages controller
  get "/about", to: "pages#about"

  # 會員註冊頁面
  get "/sign_up", to: "users#sign_up"
  post "/registering", to: "users#registering"

end
