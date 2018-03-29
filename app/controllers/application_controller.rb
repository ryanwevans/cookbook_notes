class ApplicationController < Sinatra::Base
  use Rack::Flash
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  helpers do
    def redirect_unless_logged_in
      unless logged_in?
        redirect '/users/login'
      end
    end

    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find_by(id: session[:id])
    end
  end

end
