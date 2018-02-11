class CookbooksController < ApplicationController

  get '/cookbooks' do
    erb ':/cookbooks/cookbooks'
  end

  get '/cookbooks/new' do
    erb ':/cookbooks/create_cookbook'
  end

end
