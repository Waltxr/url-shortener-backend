class Api::V1::UrlsController < ApplicationController


  def create
      @url = Url.new(url_params)
      if @url.save
        id = @url.id
        @url.create_slug(id)
        render json: @url
      else
        render json: {errors: @url.errors.full_messages}
      end
  end

  def show
    @url = Url.find_by_slug(params[:slug])
    if @url
      @url.increment_access_count
      @url.save
      redirect_to @url.decoded_url
    end
  end

  def index
    render json: Url.order(access_count: :desc).limit(100)
  end

  private
  def url_params
    params.require(:decoded_url).permit(:decoded_url)
  end

end
