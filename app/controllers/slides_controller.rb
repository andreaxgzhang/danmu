class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]
  def index
    @slides = policy_scope(Slide).order(created_at: :desc)
  end
  def show
    @slide = Slide.includes(comments: :user).find(params[:id])
  end
  def new
    @slide = Slide.new
  end
  def create
    @slide = Slide.new(set_params)
    if @slide.save
      redirect_to @slide
    else
      render new
    end
  end
  private
  def set_slide
    @slide = Slide.find(params[:id])
    authorize @slide
  end

  def set_params
    params.require(:slide).permit(:iframe, :user_id)
  end
end
