class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = current_user.comments.new(comment_params.merge(prototype_id: @prototype.id))
    
    if @comment.save
      redirect_to prototype_path(@prototype) 
    else
      @comments=@prototype.comments.includes(:user)
      render "prototypes/show", status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
