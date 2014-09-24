class PicturesController < InheritedResources::Base
  actions :show, :destroy
  before_filter :require_user, except: [:index, :show]
  before_filter :find_album

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to albums_path
    else
      format.html { render action: "new" }
    end
  end


  def index
    @pictures = Picture.all
    @album = Album.all

    respond_to do |format|
      format.html
      format.json { render json: @pictures }
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:photo, :caption, :album_id)
  end
end
