class CookbooksController < ApplicationController

  # view all cookbooks
  get '/cookbooks' do
    erb ':/cookbooks/cookbooks'
  end

  # view a specific cookbook
  get '/cookbooks/:id' do
    erb ':/cookbooks/show_cookbook'
  end

  # view form to create new cookbook
  get '/cookbooks/new' do
    erb ':/cookbooks/create_cookbook'
  end

  # post new cookbook from form to db of all cookbooks
  post '/cookbooks' do

  end

  # view form to edit a specific cookbook
  get '/cookbooks/:id/edit' do
    erb ':/cookbooks/edit_cookbook'
  end

  # patch updated cookbook info from edit form to specific cookbook
  patch '/cookbooks/:id' do

  end

end
