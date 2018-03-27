class ApplicationController < Sinatra::Base

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
    # def raise_error_if_empty
    #   if params[:content] == ""
    #     begin
    #       raise EmptyFormError
    #     rescue EmptyFormError => error
    #         puts error.message
    #     end
    #   end
    # end

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

  # class EmptyFormError < StandardError
  #   def message
  #     "Cannot save empty note!  Please try again."
  #   end
  # end

end
