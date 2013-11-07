HwBlogApp::Application.routes.draw do
  root to: "posts#index"
  resources :posts, :comments, :text_posts, :photo_posts
end
