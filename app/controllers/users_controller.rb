class UsersController < ApplicationController

  get '/signup' do
    redirect_unless_logged_in
    erb ':/users/create_user'
  end

  post '/signup' do
    redirect_unless_logged_in
    redirect '/cookbooks/cookbooks'
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
