class NotesController < ApplicationController

	before_filter :authorize_access

	def create
		@user = User.find(params[:user_id])
		@note = @user.notes.create(params[:note].permit(:title, :description))
		redirect_to user_path(@user)
	end

	def destroy
    	@user = User.find(params[:user_id])
    	@note = @user.notes.find(params[:id])
	    @note.destroy
    	redirect_to user_path(@user)
  	end

end
