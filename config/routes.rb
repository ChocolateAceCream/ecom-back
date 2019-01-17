Rails.application.routes.draw do

    get 'orders/index'
    scope :format => true, :constraints => { :format => 'json'} do
        post "/login" => "sessions#login"
        post "/signup" => "sessions#signup"
        delete "/logout" => "sessions#destroy"
    end
end
