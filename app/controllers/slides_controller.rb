class SlidesController < ApplicationController

  before_action :set_slide, only: [:show, :edit, :update, :destroy]
  def index
    @slides = policy_scope(Slide).order(created_at: :desc)
  end
  def show
    @slide = Slide.includes(comments: :user).find(params[:id])
    @qr = RQRCode::QRCode.new("http://localhost:3000/slides/#{@slide.id}/comments/new")
    @svg = @qr.as_svg(offset: 0, color: '000',
                    shape_rendering: 'crispEdges',
                    module_size: 11)

  end
  def dashboard
    @slides = Slide.all
    authorize @slides
  end

  def new
    @slide = Slide.new
    authorize @slide
  end
  def create
    @slide = Slide.new(set_params)
    @slide.user = current_user
    if @slide.save
      redirect_to @slide
    else
      render new
    end
  end
  def edit
    @slide = Slide.find(params[:id])
  end
  def update
    @slide = Slide.find(params[:id])
    @slide.update(set_params)
    redirect_to slides_path
  end
  def destroy
    @slide = Slide.find(params[:id])
    @slide.destroy
    redirect_to slides_path
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
