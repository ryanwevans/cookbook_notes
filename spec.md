# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Used methods for routes available in the Sinatra library
- [x] Use ActiveRecord for storing information in a database - Models and their relationships were mapped using ActiveRecord
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - User, Cookbook, Note
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - User has_many Cookbooks, User has_many Notes, Cookbook has_many Notes
- [x] Include user accounts - Done through the create_user.erb page for account creation, login.erb to sign in to your account
- [x] Ensure that users can't modify content created by other users - Done by assigning user_id to Cookbook and Note and show_cookbook/edit_cookbook and edit_note pages check current_user.id matches the cookbook.user_id/note.user_id
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Done in the CookbooksController & NotesController with:
  Creating: '/cookbooks/new' & '/notes/new'
  Reading: '/cookbooks/:id' & '/notes/:id'
  Updating: '/cookbooks/:id/edit' & '/notes/:id/edit'
  Deleting:'/cookbooks/:id/delete' & '/notes/:id/delete'
- [x] Include user input validations - 
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
