class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if @user && @user.save
      session[:id] = @user.id
      redirect '/cookbooks'
    else
      erb :'/users/create_user'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect '/cookbooks'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    redirect_unless_logged_in
    session.clear
    redirect '/login'
  end

end
