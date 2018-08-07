class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  def create
    @comment = Comment.new(comment_params)
    @slide = Slide.find(params[:slide_id])
    @comment.slide = @slide
    @comment.user = current_user
    authorize(@comment)

    if @comment.save

      ActionCable.server.broadcast("slide_#{@slide.id}", {
        comment_partial: (render @comment) }
      )
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
