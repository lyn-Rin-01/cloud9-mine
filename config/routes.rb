Rails.application.routes.draw do
  get 'books/top'
  root to: 'homes#top'
  get '/books/:id/edit'=>'books#edit'
  patch '/books/:id/edit'=>'books#edit'
  resources:books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
