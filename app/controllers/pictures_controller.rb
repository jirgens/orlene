class PicturesController < InheritedResources::Base
  actions :show
  before_filter :require_user, except: [:index, :show]


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

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to albums_path
  end

  private

  def picture_params
    params.require(:picture).permit(:photo, :caption, :album_id)
  end
end
