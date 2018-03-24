class NotesController < ApplicationController

# This may not be needed
    # view all notes
    get '/notes' do
      redirect_unless_logged_in
      # replace this: User.find_by(id: session[:id]) with: current_user
      @user = current_user
      erb :'/notes/notes'
    end

    # view form to create new note
    get '/notes/new' do
      redirect_unless_logged_in
      # replace this: User.find_by(id: session[:id]) with: current_user
      @user = current_user
      erb :'/notes/create_note'
    end

    # post new note from form to db of all notes
    post '/notes' do
      redirect_unless_logged_in
      @note = Note.create(params[:note])
      # @note.user_id = current_user.id
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
      @note.update(content: params[:content])
      # if !params[:cookbook_id].empty?
      #   @note.cookbook_id = params[:cookbook_id]
      # end
      @note.save
      redirect "/notes"
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
