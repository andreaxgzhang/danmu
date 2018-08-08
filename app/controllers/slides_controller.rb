class SlidesController < ApplicationController

  before_action :set_slide, only: [:show, :edit, :update, :destroy]
  def index
    @slides = policy_scope(Slide).order(created_at: :desc)
  end
  def show
    @slide = Slide.includes(comments: :user).find(params[:id])
  end
  def dashboard
    @slides = Slide.all
    authorize @slides
  end
  private
  def set_slide
    @slide = Slide.find(params[:id])
    authorize @slide
  end
end
