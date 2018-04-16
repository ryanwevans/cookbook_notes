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
      @cookbook_id = params[:note][:cookbook_id]
      if params[:note][:content] == ""
        flash[:error_message] = "* * * Your Note Didn't Contain Any Content * * *"
        redirect "/cookbooks/#{@cookbook_id}"
      else
        @note = Note.create(params[:note])
        @note.user_id = current_user.id
        @note.save
        redirect "/cookbooks/#{@cookbook_id}"
      end
    end

    # view form to edit a specific note
    get '/notes/:id/edit' do
      redirect_unless_logged_in
      @note = Note.find_by(id: params[:id])
      if current_user.id == @note.user_id
        erb :'/notes/edit_note'
      else
        redirect '/login'
      end
    end

    # view a specific note
    get '/notes/:id' do
      redirect_unless_logged_in
      @note = Note.find_by(id: params[:id])
      if current_user.id == @note.user_id
        erb :'/notes/show_note'
      else
        redirect '/login'
      end
    end

    # patch updated note info from edit form to specific note
    post '/notes/:id' do
      redirect_unless_logged_in
      @note = Note.find_by(id: params[:id])
      if @note.content == params[:content]
        flash[:error_message] = "* * * Your Update Didn't Contain Any Changes * * *"
        redirect "/cookbooks/#{@note.cookbook_id}"
      else
        @note.update(content: params[:content])
        @note.save
        redirect "/cookbooks/#{@note.cookbook_id}"
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
      redirect "/cookbooks/#{@note.cookbook_id}"
    end

end
