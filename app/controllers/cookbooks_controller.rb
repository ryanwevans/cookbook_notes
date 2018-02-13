class CookbooksController < ApplicationController

  # view all cookbooks
  get '/cookbooks' do
    redirect_unless_logged_in
    erb ':/cookbooks/cookbooks'
  end

  # view a specific cookbook
  get '/cookbooks/:id' do
    redirect_unless_logged_in
    @cookbook = Cookbook.find(params[:id])
    erb ':/cookbooks/show_cookbook'
  end

  # view form to create new cookbook
  get '/cookbooks/new' do
    redirect_unless_logged_in
    erb ':/cookbooks/create_cookbook'
  end

  # post new cookbook from form to db of all cookbooks
  post '/cookbooks' do
    redirect_unless_logged_in
    @cookbook = Cookbook.create(:cookbook_name => params[:cookbook_name])
    if !params[:note_id].empty?
      @cookbook.note_id = params[:note_id]
    end
    @cookbook.user_id = current_user.id
    @cookbook.save
    redirect '/cookbooks'
  end

  # view form to edit a specific cookbook
  get '/cookbooks/:id/edit' do
    redirect_unless_logged_in
    erb ':/cookbooks/edit_cookbook'
  end

  # patch updated cookbook info from edit form to specific cookbook
  patch '/cookbooks/:id' do
    redirect_unless_logged_in
    @cookbook = Cookbook.find(params[:id])
    @cookbook.cookbook_name = params[:cookbook_name]
    if !params[:note_id].empty?
      @cookbook.note_id = params[:note_id]
    end
    @cookbook.save
    redirect '/cookbooks'
  end

end
