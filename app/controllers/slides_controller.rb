class SlidesController < ApplicationController

  before_action :set_slide, only: [:show, :edit, :update, :destroy]
  def index
    @slides = policy_scope(Slide).order(created_at: :desc)
  end
  def show
    @slide = Slide.includes(comments: :user).find(params[:id])
    @qr = RQRCode::QRCode.new("https://danmu-on-slide.herokuapp.com/slides/#{@slide.id}/comments/new")
    @svg = @qr.as_svg(offset: 0, color: '000',
                    shape_rendering: 'crispEdges',
                    module_size: 2.5)
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
    authorize @slide
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
    @slide = current_user.slides.find(params[:id])
    authorize @slide
    if @slide.update(set_params)
      redirect_to slides_path
    else
      render :edit
    end
  end
  def destroy
    @slide = current_user.slides.find(params[:id])
    authorize @slide
    @slide.destroy
    redirect_to slides_path
  end

  private
  def set_slide
    @slide = Slide.find(params[:id])
    authorize @slide
  end

  def set_params
    params.require(:slide).permit(:iframe, :user_id, :name, :description, :photo)
  end
end
