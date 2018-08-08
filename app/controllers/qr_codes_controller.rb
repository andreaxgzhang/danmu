class QrCodesController < ApplicationController
  def new
    @qr = RQRCode::QRCode.new()
    authorize @qr
  end

  def create
    @qr = RQRCode::QRCode.new( qr_code_params[:url])
    authorize @qr
  end

  private
  def qr_code_params
    params.require(:qr_code).permit(:url)
  end
end
