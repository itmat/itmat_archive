ItmatArchive::Application.routes.draw do
  resources :experiments, except: :destroy
  root :to => 'experiments#index'
end
