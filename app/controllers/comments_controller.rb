class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_slide, only: [:destroy, :update]
  def index
    @comments = policy_scope(Comment).order(created_at: :ASC)
    # @comments = @comments.select{}
    @slide = Slide.includes(comments: :user).find(params[:slide_id])
  end
  def new
    @comments = Comment.all.select { |comment| comment.approved == true }
    @slide = Slide.find(params[:slide_id])
    @comment = Comment.new
    authorize @comment
  end
  def create
    @comment = Comment.new(comment_params)
    @slide = Slide.find(params[:slide_id])
    @comment.slide = @slide
    @comment.user = current_user

    authorize @comment
    if @comment.save
      ActionCable.server.broadcast("slide_#{@slide.id}_comments", {
         filter: render(partial: "comments/comment_filter", locals: { comment: @comment, slide: @slide})
       })
    else
      respond_to do |format|
        # format.html { render 'comments/show' }
        format.js
      end
    end

    # if @comment.save
    #   ActionCable.server.broadcast("slide_#{@slide.id}", {
    #     comment: (@comment.content) }
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
      respond_to do |format|
        format.js
      end
    else
      render :new
      flash[:notice] = "please enter a comment"
    end

  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
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
