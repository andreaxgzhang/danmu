class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_slide, only: [:destroy, :update]
  def index
    @comments = policy_scope(Comment).order(created_at: :ASC)
    # @comments = @comments.select{}
    @slide = Slide.includes(comments: :user).find(params[:slide_id])
  end
  def create
    p "hhhhhhhh"
    p comment_params
    @comment = Comment.new(comment_params)
    @slide = Slide.find(params[:slide_id])
    @comment.slide = @slide
    @comment.user = current_user
    authorize(@comment)
    if @comment.save
      p 'aaa'
    end
    # if @comment.save
    #   ActionCable.server.broadcast("slide_#{@slide.id}", {
    #     comment: (@comment.content), color: (colors[@comment.color]) }
    #   )
    # end
  end

  def update
    colors = { 'red' =>'#FF0000', 'orange' => '#FFA500', 'yellow' => '#FFFF00', 'white' => '#FFFFFF', 'maroon' => '#800000',
          'olive' => '#808000', 'green' => '#008000', 'purple' => '#800080', 'blue' => '#0000FF', 'black' => '#000000',
          'white' => '#FFFFFF', 'pink' => '#FFC0CB'}
    if @comment.update(approved: params[:approved])
      ActionCable.server.broadcast("slide_#{@slide.id}", {
        comment: (@comment.content), color: (colors[@comment.color]) }
      )
      # @comment.destroy
      redirect_to slide_comments_path(@slide)
    end

  end

  def destroy
    @comment.destroy
    redirect_to slide_comments_path(@slide)
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :content, :color)
  end

  def set_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def set_slide
    @slide = Slide.find(params[:slide_id])
  end
end
