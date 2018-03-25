class CookbooksController < ApplicationController

  # view all cookbooks
  get '/cookbooks' do
    redirect_unless_logged_in
    # replace this: User.find_by(id: session[:id]) with: current_user
    @user = current_user
    @cookbooks = @user.cookbooks.all
    if !@cookbooks.empty?
      @message = "Here are all of your cookbooks:"
    else
      @message = "Add cookbooks to your list"
    end
    erb :'/cookbooks/cookbooks'
  end

  # view form to create new cookbook
  get '/cookbooks/new' do
    redirect_unless_logged_in
    erb :'/cookbooks/create_cookbook'
  end

  # post new cookbook from form to db of all cookbooks
  post '/cookbooks' do
    redirect_unless_logged_in
    @cookbook = Cookbook.create(:cookbook_name => params[:cookbook_name])
    @cookbook.user_id = current_user.id
    @cookbook.save
    redirect '/cookbooks'
  end

  # view a specific cookbook
  get '/cookbooks/:id' do
    redirect_unless_logged_in
    # replace this: User.find_by(id: session[:id]) with: current_user
    @user = current_user
    @cookbook = Cookbook.find_by(id: params[:id])
    @notes = @cookbook.notes.all
    erb :'/cookbooks/show_cookbook'
  end

  # view form to edit a specific cookbook
  get '/cookbooks/:id/edit' do
    redirect_unless_logged_in
    @cookbook = Cookbook.find(params[:id])
    erb :'/cookbooks/edit_cookbook'
  end

  # patch updated cookbook info from edit form to specific cookbook
  patch '/cookbooks/:id' do
    redirect_unless_logged_in
    @cookbook = Cookbook.find(params[:id])
    @cookbook.cookbook_name = params[:cookbook_name]
    @cookbook.save
    redirect '/cookbooks'
  end

  # delete a specific cookbook from all cookbooks
  delete '/cookbooks/:id' do
    redirect_unless_logged_in
    @cookbook = Cookbook.find(params[:id])
    if current_user.id == @cookbook.user_id
      @cookbook.delete
    end
    redirect '/cookbooks'
  end

end
