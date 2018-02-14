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
      redirect '/signup'
    end

  end

  get '/login' do
    redirect_unless_logged_in
    erb :'users/login'
  end

  post '/login' do
    redirect_unless_logged_in
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect '/cookbooks/cookbooks'
    else
      redirect '/users/login'
    end
  end

  get '/logout' do
    redirect_unless_logged_in
    session.clear
    redirect '/users/login'
  end

end
