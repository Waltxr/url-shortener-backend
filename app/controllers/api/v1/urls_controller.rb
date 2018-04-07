class Api::V1::UrlsController < ApplicationController

  def create
      @url = Url.new(url_params)
      if @url.save
        id = @url.id
        @url.create_slug(id)
      else
      end
  end

  def show
    @url = Url.find_by_slug(params[:slug])
    redirect_to @url.decoded_url
  end

  private
  def url_params
    params.require(:url).permit(:decoded_url)
  end

end
