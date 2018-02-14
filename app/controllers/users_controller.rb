class UsersController < ApplicationController

  get '/signup' do
    redirect_unless_logged_in
    erb ':/users/create_user'
  end

  post '/signup' do
    redirect_unless_logged_in
    @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user && @user.save
      session[:id] = @user.id
      redirect '/cookbooks/cookbooks'
    else
      redirect '/login'
    end

  end

  get '/login' do
    redirect_unless_logged_in

  end

  post '/login' do
    redirect_unless_logged_in

  end

  get '/logout' do
    redirect_unless_logged_in
    session.clear
    redirect '/login'
  end

end
