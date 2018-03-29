class NotesController < ApplicationController

    get '/notes' do
      redirect_unless_logged_in
      @user = current_user
      erb :'/notes/notes'
    end

    # view form to create new note
    get '/notes/new' do
      redirect_unless_logged_in
      @cookbook = Cookbook.find_by(id: params[:cookbook_id])
      @user = current_user
      erb :'/notes/create_note'
    end

    # post new note from form to db of all notes
    post '/notes' do
      redirect_unless_logged_in
      @note = Note.create(params[:note])
      @note.user_id = current_user.id
      @note.save
      redirect '/cookbooks'
    end

    # view form to edit a specific note
    get '/notes/:id/edit' do
      redirect_unless_logged_in
      @note = Note.find_by(id: params[:id])
      erb :'/notes/edit_note'
    end

    # view a specific note
    get '/notes/:id' do
      redirect_unless_logged_in
      @note = Note.find_by(id: params[:id])
      erb :'/notes/show_note'
    end

    # patch updated note info from edit form to specific note
    post '/notes/:id' do
      redirect_unless_logged_in
      @note = Note.find_by(id: params[:id])
      if @note.content == params[:content]
        session[:error_message] = "Nothing was changed..."
        redirect '/cookbooks'
      else
        @note.update(content: params[:content])
        @note.save
        redirect "/notes"
      end
    end

    # delete a specific note from all notes
    delete '/notes/:id/delete' do
      redirect_unless_logged_in
      @note = Note.find(params[:id])
      if current_user.id == @note.user_id
        @note.delete
      end
      @note.delete
      redirect "/cookbooks"
    end

end
