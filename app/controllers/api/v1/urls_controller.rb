class Api::V1::UrlsController < ApplicationController


  def create
      @url = Url.new(url_params['decoded_url'])
      if @url.save
        id = @url.id
        @url.create_slug(id)
        render json: @url
      else
      end
  end

  def show
    @url = Url.find_by_slug(params[:slug])
    if @url
      @url.increment_access_count
      @url.save
      redirect_to @url.decoded_url
    else
      redirect_to 'http://localhost:3001/'
    end
  end

  def index
    render json: Url.order(access_count: :desc).limit(100)
  end

  private
  def url_params
    params.require(:url).permit!
  end

end
